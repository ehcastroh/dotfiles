#!/user/bin/env bash
set -e
cd ~/.dotfiles
sudo nixos-rebuild switch --flake .
