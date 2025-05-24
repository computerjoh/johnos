{ config, pkgs, ... }:

{
  systemd.services.flake-update = {
    description = "Update flake and rebuild NixOS";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "flake-update" ''
        set -euo pipefail
        cd /etc/nixos
        git pull origin main
        nix flake update
        nixos-rebuild switch --flake .#${config.networking.hostName}
      '';
    };
  };

  systemd.timers.flake-update = {
    description = "Timer to update flake and rebuild daily";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "03:30";
      Persistent = true;
    };
  };
}

