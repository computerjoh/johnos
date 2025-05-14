{ config, pkgs, ... }:

let
  firefoxCachePath = "~/.cache/mozilla/firefox/*/cache2";
in {

  systemd.services.clear-firefox-cache = {
    description = "Clear Firefox Cache";
    serviceConfig.ExecStart = "${pkgs.bash}/bin/bash -c 'rm -rf ${firefoxCachePath}'";
    path = [ pkgs.bash ];
  };

  systemd.timers.clear-firefox-cache = {
    description = "Timer to clear Firefox cache every few hours";
    timerConfig.OnCalendar = "hourly";
  };
}
