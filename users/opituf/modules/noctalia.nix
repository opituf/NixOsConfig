{
  programs.noctalia-shell = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./nonix/noctalia.json);
  };
}
