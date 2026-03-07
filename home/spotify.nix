{
  pkgs,
  config,
  services,
  ...
}: {
  services.librespot.enable = true;
  programs.spotify-player.enable = true;
}
