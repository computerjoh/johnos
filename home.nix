{
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    signal-desktop-bin
    helix
    ghostty
    alejandra
    vlc
    shotcut
    mumble
    prismlauncher
    r2modman
    (pkgs.vintagestory.overrideDerivation (oldAttrs: rec {
      version = "1.20.8";
      src = fetchurl {
        url = "https://cdn.vintagestory.at/gamefiles/stable/vs_client_linux-x64_${version}.tar.gz";
        hash = "sha256-IINeXUpW894ipgyEB6jYcmeImIFLzADI+jIX6ADthH8=";
      };
    }))
    trezor-suite
  ];
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    kscreenlocker.autoLock = false;
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
  };

  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = false;
      DisableFormHistory = false;
      DisplayBookmarksToolbar = "never";
      DontCheckDefaultBrowser = true;
    };

    profiles.default = {
      isDefault = true;

      settings = {
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state" = true;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.enabled" = true;
        "browser.tabs.warnOnClose" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.homepage" = "about:home";
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "devtools.theme" = "dark";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
      ];
    };
  };

  programs.git = {
    enable = true;
    userName = "John Korhel";
    userEmail = "john@korhel.net";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          github.copilot
          kamadorueda.alejandra
          dbaeumer.vscode-eslint
          jnoortheen.nix-ide
        ];
        userSettings = {
          "nix.formatterPath" = "alejandra";
        };
      };
    };
  };
}
