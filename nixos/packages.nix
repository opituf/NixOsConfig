{ pkgs, pkgs-unstable, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
	
  environment.systemPackages = with pkgs; [
    # Инструменты и утилиты
    git
    kdePackages.kate
    fastfetch       
    ranger
    pavucontrol     
    blueman         
    iptables
    wget
    piper
    neofetch
    btop
    nfs-utils
    home-manager
    gnumake
    fastfetch
    bottles
    distrobox
    zip
    unzip
    p7zip
    alacritty
    inetutils
    rar
    ntfs3g

    # Приложения
    brave
    pkgs-unstable.radio-active
    telegram-desktop
    vlc
    throne
    libreoffice-qt
    vesktop
    krita
    qbittorrent
    orca-slicer
    code-cursor
    python3
    zoom-us
    arduino
    prismlauncher
    remmina
    filezilla
    #pureref
    gparted
    vlc
    pkgs-unstable.crossmacro
    zathuraPkgs.zathura_core

    fuzzel
    grim
    slurp
    swappy
    wl-clipboard
    alsa-utils
    xwayland-satellite
    swaybg
    pkgs-unstable.noctalia-shell
    imv
    yazi

    # Темы
    zsh-powerlevel10k
  ];

  fonts.packages = with pkgs; [
  ];
}
