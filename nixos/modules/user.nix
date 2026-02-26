{ config, pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.opituf = {
      isNormalUser = true;
      description = "opituf";
      extraGroups = [ "networkmanager" "wheel" "podman" ];
    };
  };
}
