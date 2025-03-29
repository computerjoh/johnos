{ config, pkgs, ... }:

{
  # Audio
  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  
  # Input devices
  services.ratbagd.enable = true;
  
  # Printing
  services.printing.enable = true;
  
  # SSD Optimization
  services.fstrim.enable = true;
}
