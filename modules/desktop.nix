{
  pkgs,
  config,
  ...
}: {
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.enable = true;
      autoLogin = {
        enable = true;
        user = "john";
      };
    };
  };
}
