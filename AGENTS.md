# Agent operating notes

Treat this repository as the homelab's operational source of truth.

- Read `reports/current-state.md` before investigating or changing the system.
- Never place credentials or tokens in Git; use referenced secret locations.
- Preserve manual changes until their purpose is understood.
- Prefer idempotent scripts and declarative configuration.
- Validate configuration before restarting services.
- Record material changes, verification results, and unresolved issues in
  `reports/current-state.md`.
- Store timestamped automated reports in `reports/history/`; these are local and
  ignored by Git unless intentionally promoted into documentation.
- Destructive storage, media-library, networking, or access-control actions
  require explicit user approval.

