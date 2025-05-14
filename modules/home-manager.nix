{ config, pkgs, ... }:

{
  home-manager.users.john = {
    programs.git.enable = true;
  };
}

