{
  config,
  pkgs,
  ...
}: {
  # Shell
  programs.fish.enable = true;

  # Gaming
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    # Development
    helix
    ghostty
    pkgs.qt5.full
    pkgs.qtcreator

    # Internet
    firefox

    # Media
    vlc
    shotcut

    # Gaming
    mumble
    prismlauncher
    r2modman
    (pkgs.vintagestory.overrideDerivation (oldAttrs: rec {
      version = "1.20.8";
      src = fetchurl {
        url = "https://cdn.vintagestory.at/gamefiles/stable/vs_client_linux-x64_${version}.tar.gz";
        hash = "sha256-IINeXUpW894ipgyEB6jYcmeImIFLzADI+jIX6ADthH8=";
      };
    }))
    # System Tools
    solaar
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    rocmPackages.rocm-smi
    (pkgs.btop.override {
      rocmSupport = true;
    })

    # Other
    signal-desktop-bin
    trezor-suite
  ];
}
