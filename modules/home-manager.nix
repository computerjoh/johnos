{ config, pkgs, ... }:

{
  home-manager.users.john = {
   home.stateVersion = "24.11";
   programs.git.enable = true;
   programs.home-manager.enable = true;
  };
}

