{ config, ... }:
let
  flakeDir = "~/.dotfiles";
  host     = "laptop";
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      rb  = "sudo nixos-rebuild switch --flake ${flakeDir}#${host}";
      upd = "nix flake update ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}#${host}";

      hms = "home-manager switch --flake ${flakeDir}";

      pkgs = "nano ${flakeDir}/nixos/packages.nix";
    };
  };
}
