{
  pkgs,
  config,
  ...
}: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;
}
