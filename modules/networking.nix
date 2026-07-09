{hostname, ...}: {
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;
}
