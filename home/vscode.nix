{ pkgs
, ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          github.copilot
          dbaeumer.vscode-eslint
          jnoortheen.nix-ide
        ];
        userSettings = {
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "nix.serverSettings" = {
            "nixd" = {
              "formatting" = {
                "command" = [ "nixpkgs-fmt" ];
              };
            };
          };
          "editor.formatOnSave" = true;
        };
      };
    };
  };

  home.packages = with pkgs; [
    nixd
    nixpkgs-fmt
  ];
}
