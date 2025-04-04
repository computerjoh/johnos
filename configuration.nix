{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/localization.nix
    ./modules/users.nix
    ./modules/desktop.nix
    ./modules/programs.nix
    ./modules/hardware.nix
    ./modules/wooting.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
