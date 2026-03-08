{
  config,
  pkgs,
  ...
}: let
  spotify-player-custom = pkgs.spotify-player.overrideAttrs (old: {
    cargoFeatures = ["alsa-backend" "pixelate"];
  });
in {
  programs.spotify-player = {
    enable = true;
    package = spotify-player-custom;

    settings = {
      theme = "default";
      playback_window_position = "Top";

      copy_command = {
        command = "wl-copy";
        args = [];
      };

      device = {
        audio_cache = false;
        normalization = false;
      };
    };
  };
}
