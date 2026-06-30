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

    associations.added = {
      "x-scheme-handler/claude-cli" = ["claude-code-url-handler.desktop"];
    };

    defaultApplications = {
      "text/html" = ["chromium.desktop"];
      "x-scheme-handler/http" = ["chromium.desktop"];
      "x-scheme-handler/https" = ["chromium.desktop"];
      "x-scheme-handler/claude-cli" = ["claude-code-url-handler.desktop"];
    };
  };
}
