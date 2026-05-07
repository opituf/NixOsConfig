{ config, pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;

    users.opituf = {
      isNormalUser = true;
      description = "opituf";
      extraGroups = [ "networkmanager" "wheel" "podman" ];
    };
  };
}
