{ config, pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.printing.enable = true;
}
