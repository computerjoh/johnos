{pkgs, ...}: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    kscreenlocker = {
      autoLock = false;
      timeout = 0;
      lockOnResume = false;
      passwordRequired = false;
      lockOnStartup = false;
    };
    powerdevil.AC = {
      autoSuspend = {
        action = "nothing";
        idleTimeout = null;
      };
      dimDisplay = {
        enable = false;
        idleTimeout = null;
      };
      displayBrightness = 100;
      turnOffDisplay = {
        idleTimeout = "never";
        idleTimeoutWhenLocked = null;
      };
      powerProfile = "performance";
      whenSleepingEnter = null;
    };
    startup.startupScript."solaar" = {
      text = "${pkgs.solaar}/bin/solaar --window=hide &";
      priority = 5;
      runAlways = true;
    };
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
      iconTheme = "Papirus";
    };
    kwin.effects = {
      minimization.animation = "off";
      windowOpenClose.animation = "off";
    };
    input.mice = let
      mkMouse = {
        name,
        productId,
      }: {
        acceleration = 0.0;
        accelerationProfile = "none";
        enable = true;
        leftHanded = false;
        middleButtonEmulation = false;
        naturalScroll = false;
        scrollSpeed = 1;
        vendorId = "046d";
        inherit name productId;
      };
    in
      map mkMouse [
        {
          name = "Logitech USB Receiver";
          productId = "c547";
        }
        {
          name = "Logitech PRO X Wireless";
          productId = "c094";
        }
      ];
  };
}
