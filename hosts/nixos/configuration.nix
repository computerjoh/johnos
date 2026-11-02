{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/boot.nix
    ../../modules/networking.nix
    ../../modules/localization.nix
    ../../modules/users.nix
    ../../modules/desktop.nix
    ../../modules/programs/steam.nix
    ../../modules/programs/gamemode.nix
    ../../modules/services/pipewire.nix
    ../../modules/services/fstrim.nix
    ../../modules/services/music.nix
    ../../modules/hardware/mouse.nix
    ../../modules/hardware/keyboard.nix
  ];

  environment.systemPackages = with pkgs; [
    solaar
    mumble
    signal-desktop
    prismlauncher
    r2modman
    streamrip
    claude-code
    obsidian
    ffmpeg
    zoom-us
    lsof
    vlc
    wl-clipboard
    jq
    fd
    yq-go
    postgresql
    shellcheck
    ast-grep
  ];

  # Nightly rebuild that bumps only the claude-code input; everything else
  # stays at the revisions in flake.lock. `path:` because root reads John's
  # repo, which git's ownership check would reject.
  system.autoUpgrade = {
    enable = true;
    flake = "path:/home/john/johnos#nixos";
    flags = ["--update-input" "claude-code"];
    dates = "04:00";
    randomizedDelaySec = "30min";
    persistent = true;
  };

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

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    openssl
  ];

  system.stateVersion = "24.11";
}
