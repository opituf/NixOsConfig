# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  # Ensure NFS client services are available
  services.rpcbind.enable = true; # Sometimes required for automatic mounting

  fileSystems."/mnt/nas" = {
    device = "192.168.0.10:Public";
    fsType = "nfs";
    options = [
      "vers=4" # Specify an NFS version if needed
      "rw"
      "nofail"
    ];
  };
}
