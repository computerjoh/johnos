{
  config,
  pkgs,
  ...
}: {
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
