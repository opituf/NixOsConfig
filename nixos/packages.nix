{ pkgs, pkgs-unstable, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
	
  environment.systemPackages = with pkgs; [
    # Инструменты и утилиты
    git
    python3
    pavucontrol     
    blueman         
    btop
    nfs-utils
    home-manager
    fastfetch
    zip
    unzip
    p7zip
    alacritty
    inetutils
    rar
    ntfs3g
    brightnessctl
    alsa-utils
    yazi
    kitty
    rustup
    tldr
    pkgs-unstable.fresh-editor
    nil
    tty-clock

    # Приложения
    neovim
    brave
    pkgs-unstable.radio-active
    telegram-desktop
    vlc
    libreoffice-qt
    qbittorrent
    zoom-us
    remmina
    filezilla
    gparted

    # Темы
    zsh-powerlevel10k
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
