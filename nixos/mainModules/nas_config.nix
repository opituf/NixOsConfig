# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  # Ensure NFS client services are available
  services.rpcbind.enable = true; # Sometimes required for automatic mounting

  fileSystems."/mnt/nas" = {
  device = "192.168.0.10:Public";
  fsType = "nfs";
  options = [
    "vers=4"
    "rw"
    "nofail"
    "_netdev"                        # ← ждать сеть перед монтированием
    "x-systemd.automount"            # ← монтировать лениво, при первом обращении
    "x-systemd.mount-timeout=30s"    # ← не висеть вечно если NAS недоступен
    "x-systemd.idle-timeout=600"     # ← отмонтировать если не используется
  ];
};
}
