{ config, pkgs, ... }:

let
  flakeUpdateScript = pkgs.writeShellScript "flake-update" ''
    set -euo pipefail
    export PATH=${pkgs.git}/bin:${pkgs.nix}/bin:/run/current-system/sw/bin
    export HOME=/root

    cd /home/john/johnos

    ${pkgs.git}/bin/git -c safe.directory=/home/john/johnos pull origin main || echo "⚠️ git pull failed"

    # Nix also needs to trust this repo when run as root
    export GIT_CONFIG_GLOBAL=/etc/gitconfig
    ${pkgs.git}/bin/git config --global --add safe.directory /home/john/johnos

    ${pkgs.nix}/bin/nix flake update --flake /home/john/johnos
    ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake /home/john/johnos
  '';
in {
  systemd.services.flake-update = {
    description = "Update flake and rebuild NixOS";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${flakeUpdateScript}";
    };
  };

  systemd.timers.flake-update = {
    description = "Daily flake update timer";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "03:30";
      Persistent = true;
    };
  };
}
