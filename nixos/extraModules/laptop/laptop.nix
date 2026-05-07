{ config, pkgs, ...}:
{
  services.throttled.enable = true;
  services.libinput.enable = true;

  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-vaapi-driver
    ];
  };
}
