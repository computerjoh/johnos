{ config, pkgs, ... }:

{
  home-manager.users.john = {
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      extraConfig = {
        user = {
          name = "John Korhel";
          email = "john@korhel.net";
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    profiles = {};
    extensions = with pkgs.vscode-extensions; [
        github.copilot
        jnoortheen.nix-ide
        dbaeumer.vscode-eslint
    ];
  };
  };
}
