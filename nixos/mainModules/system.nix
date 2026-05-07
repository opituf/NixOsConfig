{ config, pkgs, pkgs-unstable, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs-unstable.linuxPackages_latest;
  };

  hardware.bluetooth.enable = true;

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
  hardware.firmware = [
    pkgs.linux-firmware
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      vulkan-loader
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa
    ];
  };
}
