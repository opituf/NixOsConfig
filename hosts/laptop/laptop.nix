{ config, pkgs, ...}:
{
  boot.kernelParams = [
    "i915.enable_psr=0"
    "nvme_core.default_ps_max_latency_us=0"
  ];

  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0 uapsd_disable=1
    options iwlmvm power_scheme=1
  '';

  services.throttled.enable = true;
  services.libinput.enable = true;

  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      intel-compute-runtime-legacy1
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-vaapi-driver
    ];
  };
}
