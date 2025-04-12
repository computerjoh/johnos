{ config, pkgs, ... }:

{
  # Shell
  programs.fish.enable = true;
  
  # Gaming
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  
  # System Packages
  environment.systemPackages = with pkgs; [
    # Development
    helix
    git
    vscode
    docker
    ghostty
    
    # Internet
    firefox
    
    # Media
    vlc
    shotcut
    
    # Gaming
    mumble
    prismlauncher
    r2modman
    # System Tools
    solaar
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    rocmPackages.rocm-smi
    (pkgs.btop.override {
      rocmSupport = true;
    })

    # Other
    signal-desktop
  ];
}
