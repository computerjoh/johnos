{
  pkgs,
  config,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 5;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # AMD chipset watchdog; systemd arms it on reboot and it stalls shutdown
  boot.blacklistedKernelModules = ["sp5100_tco"];

  # Don't wait 90s on services that hang at shutdown
  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
