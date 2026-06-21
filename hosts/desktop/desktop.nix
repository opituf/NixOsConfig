{ config, pkgs, ... }:
{
  hardware.graphics.extraPackages = with pkgs; [
  rocmPackages.clr.icd
  ];

  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [ rocblas hipblas clr ];
    };
  in [ "L+ /opt/rocm - - - - ${rocmEnv}" ];

  environment.systemPackages = with pkgs; [ rocmPackages.rocminfo clinfo ];
}
