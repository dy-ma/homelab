#!/bin/sh
set -eu

# This is intentionally a stable extension point. Future health checks can
# print a short green summary or one or more actionable warnings here.
printf '%s\n' 'No alert checks configured'
