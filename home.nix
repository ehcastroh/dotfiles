{ config, pkgs, ... }:

{
  home.username = "elcasnix";
  home.homeDirectory = "/home/elcasnix";
  home.stateVersion = "25.11";

  # ---- Symlinks: repo is the source of truth --------------------------------
  home.file.".config/wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/wezterm";
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/nvim";
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

  programs.starship = {
    enable = true;
    settings = { add_newline = false; };
  };

  home.sessionVariables = { EDITOR = "nvim"; };
}
