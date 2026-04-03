
{ pkgs, ... }: {
  home.username = "asumyth";
  home.homeDirectory = "/home/asumyth";
  home.stateVersion = "25.11";

  home.packages = with pkgs;[
    
    
    #Socials browser
    vivaldi
    vesktop
    element-desktop
    fluffychat
    droidcam
    
    # System tools
    fastfetch
    gcc
    wget
    btop
    htop
    yazi
    helix
    git
    zip
    wayland-utils
    alacritty
    fuzzel
    gimp
    
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
    heroic
    lutris
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
}
