{ config, pkgs, ... }:

{
  home-manager.users.john = {
    stateVersion = "24.11";
    programs.git.enable = true;
  };
}

