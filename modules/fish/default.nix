{
  programs.fish = {
    enable = true;
    shellAliases = {
      edit = "hx ~/.config/nix/";
      clean = "brew cleanup && brew upgrade && sudo nix-collect-garbage && nix-collect-garbage -d && cd ~/.config/nix && sudo nix flake update";
      build = "cd ~/.config/nix && sudo darwin-rebuild switch --flake .#kafka";
    };
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
      fish_add_path /opt/homebrew/bin
      set -Ux HOMEBREW_NO_ANALYTICS 1
      set -Ux HOMEBREW_NO_ENV_HINTS 1
      set -Ux HOMEBREW_NO_INSECURE_REDIRECT 1
      fish_config theme choose "Rosé Pine"
      fish_add_path /Users/kafka/.local/bin
    '';
  };
}
