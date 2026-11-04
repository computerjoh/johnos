# Headless CI box: campbuild's self-hosted GitHub Actions runners (Incus
# containers made by campbuild's scripts/ci/runner.sh), reached over SSH.
{
  pkgs,
  username,
  hostname,
  ...
}: {
  imports = [
    ../../modules/boot.nix
    ../../modules/localization.nix
    ../../modules/services/ci-runners.nix
    ../../modules/services/fstrim.nix
  ];

  networking.hostName = hostname;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID9lhJ7ywUYOCV2eJUd6zC99TdcKeVYvs1Sb3XX70056 john@korhel.net"
    ];
  };
  security.sudo.wheelNeedsPassword = false;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # A CI box stays on: no sleep, and it comes back by itself after a power cut
  # (set "restore on AC power loss" in the BIOS too).
  systemd.sleep.settings.Sleep = {
    AllowSuspend = "no";
    AllowHibernation = "no";
  };

  # The runner containers' memory caps add up to more than the box's 32 GB,
  # and it has no swap: if several jobs peak at once the host itself runs
  # out, and the kernel can kill incusd or sshd rather than one job.
  # Compressed swap in RAM absorbs those peaks.
  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = [username];
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  environment.systemPackages = with pkgs; [git gh htop];

  system.stateVersion = "26.05";
}
