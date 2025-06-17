{pkgs, ...}: {
  imports = [
    ./modules/fish
    ./modules/helix
    ./modules/kitty
    ./modules/starship
  ]; 

  home = {
    username = "kafka";
    homeDirectory = "/Users/kafka";
    stateVersion = "23.11";
    packages = with pkgs; [
      choose-gui
      fzf
      keepassxc
      terminal-notifier
    ];
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs = {
    man.enable = false;
    home-manager.enable = true;
    bash.shellOptions = ["-HISTFILE"];
  };
}
