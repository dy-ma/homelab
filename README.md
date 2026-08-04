# Homelab

Operational source of truth for this homelab: service configuration, deployment
definitions, launchd jobs, inventory, runbooks, and machine-generated reports.

## Layout

- `compose/` — Docker Compose applications and checked-in examples
- `launchd/` — macOS launch agents and daemons
- `config/` — non-secret application configuration
- `scripts/` — administration, health-check, backup, and recovery scripts
- `dotfiles/` — portable user configuration linked into the home directory
- `inventory/` — hosts, storage, network, and service inventory
- `docs/runbooks/` — setup, maintenance, failure, and recovery procedures
- `reports/` — current agent handoff plus historical health reports

## Rules

- Do not commit passwords, API keys, private keys, tokens, or generated media.
- Commit `.example` files describing required secret names and locations.
- Prefer reproducible configuration over undocumented manual changes.
- Update `reports/current-state.md` after material operational changes.
- Document recovery and rollback steps alongside each service.

## Planned services

- Native macOS Jellyfin for VideoToolbox hardware transcoding
- Servarr and supporting services, likely through OrbStack and Docker Compose
- Health checks, alerting, logging, and agent-assisted remediation
- Remote administration through Tailscale SSH, remote desktop, and JetKVM

## Bootstrap a Mac

After installing Homebrew, run:

```sh
./scripts/bootstrap-mac.sh
```

The script installs the portable shell packages from `Brewfile`, backs up any
conflicting dotfiles, and links the tracked Zsh and Starship configuration into
the current user's home directory. It is safe to run again. Bootstrap uses
`brew bundle --no-upgrade`; upgrades are a separate, deliberate maintenance
operation.

Interactive terminal sessions display a Fastfetch dashboard once, including
basic host diagnostics and the output of `scripts/homelab-status.sh`. That
script is the extension point for future service alerts and health summaries.

Portable shell helpers include `cl` (change directory and list), `ll` (long
listing), and `la` (long listing including hidden files). The tracked Git config
adds `git s`, `git aa`, and `git cm "message"` aliases while leaving the user's
name, email, credentials, and other global Git settings outside the repository.
