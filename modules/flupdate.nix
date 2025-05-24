let
  flakeUpdateScript = pkgs.writeShellScript "flake-update" ''
    #!/usr/bin/env bash
    set -euo pipefail

    FLAKE_DIR="/home/john/johnos"
    BRANCH="main"

    cd "$FLAKE_DIR"

    echo "Pulling latest changes..."
    git pull origin "$BRANCH" || echo "⚠️ git pull failed"

    echo "Updating flake inputs..."
    nix flake update

    echo "Rebuilding system..."
    nixos-rebuild switch --flake . || echo "⚠️ nixos-rebuild failed"
  '';
in

systemd.services.flake-update = {
  description = "Update flake and rebuild NixOS";
  after = [ "network-online.target" ];
  wants = [ "network-online.target" ];
  serviceConfig = {
    Type = "oneshot";
    ExecStart = "${flakeUpdateScript}";
  };
};

systemd.timers.flake-update = {
  description = "Run flake-update daily";
  wantedBy = [ "timers.target" ];
  timerConfig = {
    OnCalendar = "daily";
    Persistent = true;
  };
};
