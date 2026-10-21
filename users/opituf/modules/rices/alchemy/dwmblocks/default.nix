{ pkgs }:

pkgs.dwmblocks.overrideAttrs (old: {
  conf = null; # отключаем встроенный conf, чтобы не ломал postPatch

  postPatch = ''
    cp ${./config.h} blocks.def.h
    substituteInPlace dwmblocks.c \
      --replace-fail 'void termhandler()' 'void termhandler(int signum)'
  '';
})
