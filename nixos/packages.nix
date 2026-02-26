{ pkgs, pkgs-unstable, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
	
  environment.systemPackages = with pkgs; [
    # Инструменты и утилиты
    git
    fastfetch       
    ranger          
    xfce.thunar     
    feh  
    pavucontrol     
    bluez           
    blueman         
    iptables
    wget
    piper
    neofetch
    htop
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
    busybox
    kdePackages.isoimagewriter
    inetutils
    ntfs3g

    # Приложения
    vim
    telegram-desktop
    vlc
    amnezia-vpn
    throne
    libreoffice-qt
    vesktop
    krita
    qbittorrent
    orca-slicer
    openvpn
    code-cursor
    python3
    zoom-us
    arduino
    prismlauncher
    remmina
    boxbuddy
    filezilla
    gparted
    
    # Темы
    graphite-gtk-theme
    papirus-icon-theme
    zsh-powerlevel10k
  ];

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    powerline-fonts
    dejavu_fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
