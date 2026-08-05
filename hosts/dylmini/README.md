# dylmini

Host-specific configuration for the Mac mini that runs the homelab.

- `Brewfile` contains native server packages and applications.
- `launchd/` contains checked-in launch agents and daemons.

Install the host bundle without upgrading existing packages:

```sh
brew bundle --no-upgrade --file=hosts/dylmini/Brewfile
```

The portable developer bundle remains at the repository root and is installed
by `scripts/bootstrap-mac.sh`.
