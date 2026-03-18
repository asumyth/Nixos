
{ pkgs, pkgs-stable , ... }: {
  home.username = "asumyth";
  home.homeDirectory = "/home/asumyth";
  home.stateVersion = "25.11";

  home.packages = with pkgs;[
    
    
    #Socials browser
    vivaldi
    vesktop
    element-desktop
    
    # System tools
    fastfetch
    gcc
    wget
    btop
    htop
    yazi
    cargo
    rustup
    helix
    git
    zip
    wayland-utils
    alacritty
    fuzzel
    
    #language server
    nil

    # Audio tools
    bitwig-studio
    yt-dlp
    ffmpeg
    mpv
    pwvucontrol
    qpwgraph
    
    # Gaming
    lutris
    pkgs-stable.heroic
    gamescope
    mangohud
    protonplus
    wivrn
    openssl

    (prismlauncher.override {
      additionalPrograms = [ ffmpeg ];
      jdks = [ zulu8 zulu17 zulu25 zulu21 ];
    })

    # Dev misc
    vscode
    code-cursor
    nodePackages.nodejs
    nautilus
    
  ];



  wayland.windowManager.niri.settings = {
    spawn-at-startup = [
      { command = [ "vivaldi" ]; }
      { command = [ "element-desktop" ]; }
      { command = [ "steam"];}
      { command = [ "vesktop"];}
    ];
  };
}
