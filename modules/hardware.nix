{
  config,
  pkgs,
  ...
}: {
  # Audio
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
  };
  # Input devices
  services.ratbagd.enable = true;

  # Printing
  services.printing.enable = true;

  # SSD Optimization
  services.fstrim.enable = true;
}
