{
  systemd.services.flake-update = {
    description = "Update flake and rebuild NixOS";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/etc/nixos/update-and-rebuild.sh";
    };
  };

  systemd.timers.flake-update = {
    description = "Daily flake update and rebuild";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "03:30";
      Persistent = true;
    };
  };
}

