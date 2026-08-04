#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
backup_stamp=$(date +%Y%m%d-%H%M%S)

link_dotfile() {
  source_path="$repo_root/$1"
  target_path="$HOME/$2"

  mkdir -p "$(dirname -- "$target_path")"

  if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
    printf 'Already linked: %s\n' "$target_path"
    return
  fi

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    backup_path="${target_path}.backup.${backup_stamp}"
    mv "$target_path" "$backup_path"
    printf 'Backed up: %s -> %s\n' "$target_path" "$backup_path"
  fi

  ln -s "$source_path" "$target_path"
  printf 'Linked: %s -> %s\n' "$target_path" "$source_path"
}

if command -v brew >/dev/null 2>&1; then
  brew bundle --no-upgrade --file="$repo_root/Brewfile"
else
  printf '%s\n' 'Homebrew not found; install it and rerun this script to install packages.' >&2
fi

link_dotfile dotfiles/zshrc .zshrc
link_dotfile dotfiles/config/starship.toml .config/starship.toml
link_dotfile dotfiles/config/fastfetch .config/fastfetch
link_dotfile dotfiles/config/nvim .config/nvim
link_dotfile scripts/homelab-status.sh .local/bin/homelab-status

git_alias_config="$repo_root/dotfiles/gitconfig"
if command -v git >/dev/null 2>&1 && ! git config --global --get-all include.path | grep -Fqx "$git_alias_config"; then
  git config --global --add include.path "$git_alias_config"
  printf 'Included Git configuration: %s\n' "$git_alias_config"
fi

printf '%s\n' 'Bootstrap complete. Start a new shell or run: source ~/.zshrc'
