{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.interfaces.enp3s0.wakeOnLan.enable = true;
  services.tailscale.enable = true;
  services.openssh.enable = true;
  # Firewall Configuration
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };
}
