# Current State

Last updated: 2026-08-04

## Host

- Apple Mac mini (M4)
- Intended role: homelab control plane, native media server, and remote-dev host
- Remote access: Tailscale SSH, remote desktop, and JetKVM fallback
- Deployment status: initial repository created; services not yet configured

## Services

No services are managed by this repository yet.

## Developer environment

- Portable Zsh and Starship configuration is tracked under `dotfiles/`.
- Homebrew shell dependencies are declared in `Brewfile`.
- `scripts/bootstrap-mac.sh` installs dependencies and creates home-directory
  links while preserving conflicting files as timestamped backups.

## Storage

External NVMe enclosure and final media-storage layout are not yet installed.

## Known decisions

- Keep Jellyfin native on macOS to use VideoToolbox.
- Consider running Servarr components in OrbStack with Docker Compose.
- Keep routine agent reports in this repository so administration agents can
  hand current context to Codex without repeating discovery.

## Open items

- Record host, network, storage, and UPS inventory.
- Choose service topology and filesystem paths.
- Define backup and recovery policy before importing configuration.
- Define health checks, logging, alert routing, and safe remediation boundaries.
