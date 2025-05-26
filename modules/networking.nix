{
  config,
  pkgs,
  ...
}: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  # Firewall Configuration
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
  };
}
