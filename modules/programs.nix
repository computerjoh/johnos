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
    
    # Internet
    firefox
    
    # Media
    vlc
    shotcut
    
    # Gaming
    mumble
    prismlauncher
    
    # System Tools
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    rocmPackages.rocm-smi
    (pkgs.btop.override {
      rocmSupport = true;
    })
  ];
}
