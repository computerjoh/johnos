{
  systemd.services.flake-update = {
    description = "Pull latest config and rebuild NixOS";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = lib.mkForce (
        pkgs.writeShellScript "flake-update" ''
          set -euo pipefail
          cd /etc/nixos
          echo "[$(date)] Starting flake update..."

          git pull origin main
          nix flake update
          nixos-rebuild switch --flake .#${config.networking.hostName}

          echo "[$(date)] ✅ Flake update complete"
        ''
      );
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
