#!/bin/sh
set -eu

pressure_output=$(memory_pressure -Q 2>/dev/null || true)
available=$(printf '%s\n' "$pressure_output" | awk '
  /System-wide memory free percentage:/ {
    gsub(/%/, "", $5)
    print $5
    exit
  }
')

swap_output=$(sysctl -n vm.swapusage 2>/dev/null || true)
swap_used=$(printf '%s\n' "$swap_output" | awk '
  {
    for (i = 1; i <= NF; i++) {
      if ($i == "used") {
        print $(i + 2)
        exit
      }
    }
  }
')

if [ -z "$available" ]; then
  printf '%s\n' 'Unavailable'
  exit 0
fi

# These are homelab presentation thresholds, not Apple diagnostic categories.
# The numeric available-capacity value remains visible for interpretation.
if [ "$available" -ge 50 ]; then
  color='32'
  state='Healthy'
elif [ "$available" -ge 20 ]; then
  color='33'
  state='Watch'
else
  color='31'
  state='High pressure'
fi

if [ -n "$swap_used" ]; then
  printf '\033[%sm%s\033[0m · %s%% available · swap %s\n' \
    "$color" "$state" "$available" "$swap_used"
else
  printf '\033[%sm%s\033[0m · %s%% available\n' \
    "$color" "$state" "$available"
fi
