{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "elcasnix";
  home.homeDirectory = "/home/elcasnix";
  home.stateVersion = "25.11";

  home.packages = [
    pkgs-unstable.neovim 
    pkgs-unstable.herdr
    ];

  assertions = [{
    assertion = pkgs.lib.versionAtLeast pkgs-unstable.neovim.version "0.12.3";
    message = "neovim ${pkgs-unstable.neovim.version} is below the required 0.12.3";
  }];

  # ---- Symlinks: repo is the source of truth --------------------------------
  home.file.".config/wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/wezterm";
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/nvim"; 
  home.file.".config/herdr".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/herdr";
  home.file.".claude/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/claude/settings.json";
  home.file.".claude/CLAUDE.md".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/agents.md";

  # ---- Shell ----------------------------------------------------------------
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''bindkey '^f' autosuggest-accept'';
    shellAliases = {
      v = "nvim"; g = "git"; gs = "git status"; ga = "git add";
      gc = "git commit"; gp = "git push"; gd = "git diff";
      rebuild = "~/.dotfiles/rebuild.sh";
    };
  };
  
  # ---- git ----
  programs.git = {
    enable = true;
    settings.user = {
	name = "eliascasher";
    	email = "ehcastroh@berkeley.edu";
  	};
  };

  # ---- starship ----
  programs.starship = {
    enable = true;
    settings = { 
	add_newline = false;
	format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
	};
  };

  # ---- GNOME Keybindings ----
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Ctrl><Alt>t";
      command = "wezterm";
      name = "Open WezTerm";
    };
  };

  home.sessionVariables = { EDITOR = "nvim"; };
}
