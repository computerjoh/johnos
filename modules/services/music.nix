{
  pkgs,
  config,
  ...
}: {
  services.navidrome = {
    enable = true;
    openFirewall = true;
    user = "navidrome";
    group = "navidrome";
    settings = {
      Address = "0.0.0.0";
      Port = 4533;
      MusicFolder = "/srv/music";
      DataFolder = "/var/lib/navidrome";
      EnableInsightsCollector = false;
    };
  };

  users.groups.media = {};
  users.users.navidrome.extraGroups = ["media"];

  systemd.tmpfiles.rules = [
    "d /srv/music 2775 root media - -"
    "d /srv/music/incoming 2775 root media - -"
  ];
}
