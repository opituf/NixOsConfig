{ config, pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    orca-slicer
    code-cursor
    krita
  ];
}
