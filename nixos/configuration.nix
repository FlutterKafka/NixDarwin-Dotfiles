{inputs, config, pkgs, lib, ...}: {
  imports = [
    ./home-manager.nix
    ../modules/borders
    ../modules/skhd
    ../modules/yabai
  ];

  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = false;
    info.enable = false;
  };

  fonts.packages = [pkgs.jetbrains-mono];
  
  security.pam.services.sudo_local.touchIdAuth = true;
  
  users.users.kafka = {
    home = "/Users/kafka";
    shell = pkgs.fish;    
  };

  programs.fish.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
    caskArgs = {appdir = "~/Applications";};
    casks = [
      "libreoffice"
      "mullvad-vpn"
      "mullvad-browser"
      "signal"
      "docker"
    ];
  };

  system = {
    stateVersion = lib.mkDefault 5;
    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
        showhidden = true;
        mineffect = "scale";
        launchanim = false;
        show-process-indicators = true;
        tilesize = 48;
        static-only = true;
        mru-spaces = false;
        show-recents = false;  
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        _FXSortFoldersFirst = true;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      trackpad = {
        Clicking = true;
        ActuationStrength = 0;
        Dragging = true;
        TrackpadThreeFingerDrag = true;
        TrackpadRightClick = true;
      };
      alf = {
        globalstate = 2;
        loggingenabled = 0;
        stealthenabled = 1;
      };
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        _HIHideMenuBar = false;
      };
    };
    primaryUser = "kafka";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
      allowUnsupportedSystem = true;
    };
    hostPlatform = "aarch64-darwin"; 
  };
  environment.systemPackages = [pkgs.git];
  nix = let
    flakeInputs = lib.filterAttrs (_: v: lib.isType "flake" v) inputs;
  in {
    package = pkgs.lix;
    registry = lib.mapAttrs (_: v: {flake = v;}) flakeInputs;
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
    optimise.automatic = true;
    settings = {
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@admin"];
      substituters = ["https://cache.nixos.org?priority=10"];
      trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
    };
  };
}
