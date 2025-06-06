{
  config,
  pkgs,
  ...
}: {
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
  };
  services.ratbagd.enable = true;
  services.printing.enable = true;
  services.fstrim.enable = true;
  hardware.wooting.enable = true;
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
}
