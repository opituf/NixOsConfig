{ inputs, pkgs, ... }:

{ services.displayManager.sddm.enable = true;

  programs.silentSDDM = { enable = true; theme = "catppuccin-mocha";
  };
  
    environment.systemPackages = with pkgs; [ 
      qt6Packages.qtmultimedia
    ];
}

