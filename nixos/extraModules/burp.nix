{ inputs, pkgs, ... }: 
{
  environment.systemPackages = [
    inputs.burpsuitepro.packages.${pkgs.system}.default
  ];
}
