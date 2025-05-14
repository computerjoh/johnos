{ config, pkgs, ... }:

{
  home-manager.users.john = {
   home.stateVersion = "24.11";
   programs.home-manager.enable = true;

  programs.git = {
    userName = "John Korhel";
    userEmail = "john@korhel.net";
    extraConfig.init.defaultBranch = "main";
  };
}

