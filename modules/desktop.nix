{
  config,
  pkgs,
  ...
}: {
  # Display and Desktop
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = ["amdgpu"];
  };

  # Plasma 6
  services.desktopManager.plasma6.enable = true;

  # Display Manager
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "john";
    };
    defaultSession = "plasmax11";
  };
}
