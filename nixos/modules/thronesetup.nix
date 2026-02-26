{ config, pkgs, ... }:

{
  security.wrappers.nekobox_core= {
    owner = "root";
    group = "root";
    source = "${pkgs.nekoray}/bin/Throne";
    capabilities = "cap_net_admin=ep";
  };
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
}
