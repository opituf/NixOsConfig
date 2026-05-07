{ lib, ... }:
let
  # Load the file
  allData = builtins.fromJSON (builtins.readFile ./nonix/noctalia.json);
in
{
  programs.noctalia-shell = {
    enable = true;
    # Dig into the "settings" key specifically
    settings = lib.mkForce allData.settings;
  };
}
