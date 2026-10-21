{ lib, ... }:
let
  allData = builtins.fromJSON (builtins.readFile ./nonix/noctalia.json);
in
{
  programs.noctalia-shell = {
    enable = true;
    settings = lib.mkForce allData.settings;
  };
}
