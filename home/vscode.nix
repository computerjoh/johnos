{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          github.copilot
          kamadorueda.alejandra
        ];
        userSettings = {
          "editor.formatOnSave" = true;
        };
      };
    };
  };

  home.packages = with pkgs; [
    nixd
    alejandra
  ];
}
