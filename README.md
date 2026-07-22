# dotfiles

NixOS + Home Manager configuration using [Nix Flakes](https://nixos.wiki/wiki/Flakes). Declarative, reproducible, version-controlled system setup.

---

## Structure

```
dotfiles/
├── flake.nix                  # Entry point - defines inputs and outputs
├── configuration.nix          # System config: boot, networking, GNOME, packages
├── home.nix                   # User config: shell, git, symlinks into config/
├── hardware-configuration.nix # Auto-generated - do not edit
├── rebuild.sh                 # Apply flake changes: nixos-rebuild switch
├── config/
│   ├── nvim/                  # Neovim (lazy.nvim, snacks, neogit, oil)
│   ├── wezterm/               # WezTerm terminal emulator
│   ├── herdr/                 # Herdr terminal multiplexer
│   └── claude/                # Claude Code CLI settings + hooks
├── home/
│   └── AGENTS.md              # Shared AI agent rules (symlinked to Claude, Codex, OpenCode)
└── docs/
    ├── keybindings.md         # Full keybindings reference with examples
    └── keybindings.png        # Visual keybindings reference card
```

---

## How It Works

- `configuration.nix` manages the system: packages, services, desktop (GNOME + NVIDIA), fonts
- `home.nix` manages the user environment: zsh, git, starship prompt, and symlinks from `config/` into `~/.config/`
- Changes to `config/` (nvim, wezterm, herdr, claude) take effect immediately - no rebuild needed
- Changes to `.nix` files require running `rebuild`

---

## Applying Changes

```bash
rebuild   # alias for: sudo nixos-rebuild switch --flake ~/.dotfiles
```

Or from the repo root:

```bash
./rebuild.sh
```

---

## Key Software

| Tool | Role |
|---|---|
| [NixOS](https://nixos.org/) | Declarative OS configuration |
| [Home Manager](https://github.com/nix-community/home-manager) | User environment management |
| [Herdr](https://github.com/kunchenguid/herdr) | Terminal multiplexer (Ctrl+B prefix, vim-style navigation) |
| [Neovim](https://neovim.io/) | Editor (Space leader, lazy.nvim plugins) |
| [WezTerm](https://wezfurlong.org/wezterm/) | Terminal emulator (Rose Pine Moon, Hack Nerd Font) |
| [Starship](https://starship.rs/) | Shell prompt |

---

## Reference

- [Keybindings reference](docs/keybindings.md) - all shortcuts across GNOME, Zsh, Herdr, Neovim, and Tmux
- ![Keybindings card](docs/keybindings.png)

---

## Credits

Setup and Herdr environment guided by [Kun Chen](https://github.com/kunchenguid).
