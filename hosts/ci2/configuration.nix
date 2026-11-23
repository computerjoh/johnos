# Second headless CI box: the gaming PC (Ryzen 5 7600X, 32 GB), dual-booted
# with Windows on one drive. Same setup as hosts/ci; it differs in Wi-Fi, in
# where the bootloader lives, and in being offline while it runs Windows.
{
  lib,
  pkgs,
  ...
}: let
  # Drain the runners, then boot Windows once (NixOS stays the default, so
  # the next restart from Windows comes back here). Each runner is stopped as
  # soon as it is idle, which takes it offline so the router sends no more
  # jobs its way; a running job finishes first.
  #   ssh john@ci2 sudo to-windows
  toWindows = pkgs.writeShellApplication {
    name = "to-windows";
    runtimeInputs = [pkgs.incus pkgs.gnugrep pkgs.systemd];
    text = ''
      mapfile -t boxes < <(incus list -c n -f csv | grep '^ci2-box-' || true)
      while :; do
        busy=()
        for b in "''${boxes[@]}"; do
          if incus exec "$b" -- pgrep -x Runner.Worker >/dev/null; then
            busy+=("$b")
          else
            incus exec "$b" -- systemctl stop 'actions.runner.*' 2>/dev/null || true
          fi
        done
        [ ''${#busy[@]} -eq 0 ] && break
        echo "waiting for jobs on: ''${busy[*]}"
        sleep 15
      done
      echo "runners stopped; rebooting into Windows"
      systemctl reboot --boot-loader-entry=auto-windows
    '';
  };
in {
  imports = [../ci/configuration.nix];

  # Windows' EFI partition is 200 MB, too small for NixOS kernels. The menu
  # goes there (/efi, Windows shows up in it automatically) and the kernels
  # go on a 1 GB XBOOTLDR partition (/boot).
  boot.loader.efi.efiSysMountPoint = "/efi";
  boot.loader.systemd-boot.xbootldrMountPoint = "/boot";
  boot.loader.systemd-boot.configurationLimit = 10;

  # No Ethernet here. The Wi-Fi profile is on the machine
  # (/etc/NetworkManager/system-connections), not in this public repo.
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
  };
  networking.useDHCP = lib.mkDefault false;

  environment.systemPackages = [toWindows];
}
