{
  config,
  pkgs,
  ...
}: {
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
    ./modules/home-manager.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20"
  ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.autoUpgrade = {
    enable = true;
    flake = "github:computerjoh/johnos#nixos";
    allowReboot = true;
    dates = "03:00";
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11";
}
