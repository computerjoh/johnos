{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        biomejs.biome
      ];

      userSettings = {
        "editor.formatOnSave" = true;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "editor.codeActionsOnSave" = {
          "source.fixAll.biome" = "explicit";
          "source.organizeImports.biome" = "explicit";
        };
        "[javascriptreact]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
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
