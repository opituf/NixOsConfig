{ lib, ... }:
let
  allData = builtins.fromJSON (builtins.readFile ./nonix/noctalia.json);
  colorData = builtins.fromJSON (builtins.readFile ./nonix/colors.json);
in
{
  programs.noctalia-shell = {
    enable = true;
    settings = lib.mkForce allData.settings;
  };
  home.file.".config/noctalia/colorschemes/Sadism/Sadism.json".source = ./nonix/Sadism.json;
}
