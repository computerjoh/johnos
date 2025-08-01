{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        github.copilot
        jnoortheen.nix-ide
      ];

      userSettings = {
        "editor.formatOnSave" = true;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.serverSettings" = {
          "nil" = {
            "diagnostics" = {
              "ignored" = ["unused_binding" "unused_with"];
            };
            "formatting" = {
              "command" = ["alejandra"];
            };
          };
        };
      };
    };
  };

  home.packages = with pkgs; [
    nil
    alejandra
  ];
}
