{
  programs.fresh-editor = {
    enable = true;
    settings = {
      theme = "sadism";
    };
  };
  home.file.".config/fresh/themes/sadism.json".source = ./nonix/fresh.json;
}
