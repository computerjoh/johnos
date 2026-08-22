{pkgs, ...}: let
  wallpaper = ../assets/wallpaper.jpg;
in {
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
    startup.startupScript = {
      "solaar" = {
        text = "${pkgs.solaar}/bin/solaar --window=hide &";
        priority = 5;
        runAlways = true;
      };
      # plasma-manager's own wallpaper autostart script can fire before
      # plasmashell has finished creating the desktop containments on a
      # fresh boot, silently no-op'ing while still marking itself as
      # applied. Re-apply after a short delay so it always sticks.
      "fix-wallpaper-race" = {
        text = ''
          sleep 5
          qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
            let allDesktops = desktops();
            for (const d of allDesktops) {
              d.wallpaperPlugin = "org.kde.image";
              d.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
              d.writeConfig("Image", "file://${wallpaper}");
            }
          '
        '';
        priority = 8;
        runAlways = true;
      };
    };
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
      iconTheme = "Papirus";
      wallpaper = wallpaper;
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
