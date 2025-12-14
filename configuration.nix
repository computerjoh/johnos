{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/localization.nix
    ./modules/users.nix
    ./modules/desktop.nix
    ./modules/programs/steam.nix
    ./modules/programs/gamemode.nix
    ./modules/services/pipewire.nix
    ./modules/services/fstrim.nix
    ./modules/services/music.nix
    ./modules/hardware/mouse.nix
    ./modules/hardware/keyboard.nix
  ];

  environment.systemPackages = with pkgs; [
    solaar
    mumble
    signal-desktop-bin
    prismlauncher
    r2modman
    streamrip
    codex
    obsidian
    ffmpeg
    code-cursor
    zoom-us
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

  nixpkgs.config.allowUnfree = true;

  programs.gamescope.enable = true;

  programs.fish.enable = true;

  system.stateVersion = "24.11";
}
