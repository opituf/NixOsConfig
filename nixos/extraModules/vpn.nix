{ config, pkgs,  ...}:

{
  security.wrappers.nekobox_core= {
    owner = "root";
    group = "root";
    source = "${pkgs.throne}/bin/Throne";
    capabilities = "cap_net_admin=ep";
  };
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
  
  networking.firewall.checkReversePath = "loose";
  services.zerotierone.enable = true;

  boot.kernelModules = [ "tun" ];

  services.resolved = {
    enable = true;
    settings.Resolve.DNSSEC = "false";
  };
}
