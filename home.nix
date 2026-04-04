
{ pkgs, ... }: {
  home.username = "asumyth";
  home.homeDirectory = "/home/asumyth";
  home.stateVersion = "25.11";
  xdg.enable = true;
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
    wayvr
    motoc
    openssl

    (prismlauncher.override {
      additionalPrograms = [ ffmpeg ];
      jdks = [ zulu8 zulu17 zulu25 zulu21 ];
    })

    # Dev misc
    vscode
    code-cursor
    nodejs
    nautilus
    lmstudio
    
  ];
}
