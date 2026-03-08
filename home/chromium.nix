{
  pkgs,
  config,
  xdg,
  ...
}: {
  programs.chromium = {
    enable = true;
    extensions = [
      {id = "nngceckbapebfimnlniiiahkandclblb";} # bitwarden
    ];
  };

  # set default browser
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = ["chromium.desktop"];
      "x-scheme-handler/http" = ["chromium.desktop"];
      "x-scheme-handler/https" = ["chromium.desktop"];
    };
  };
}
