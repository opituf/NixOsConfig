{
programs.yazi = {
  enable = true;
  settings = {
    opener = {
      image = [
        { run = ''imv "$@"''; desc = "imv"; block = false; }
      ];
    };
    open = {
      prepend_rules = [
        { mime = "image/*"; use = "image"; }
      ];
    };
  };
};
}
