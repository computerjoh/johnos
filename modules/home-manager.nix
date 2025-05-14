{ config, pkgs, ... }:

{
  home-manager.users.john = {
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      extraConfig = {
        user = {
          name = "test";
          email = "test";
        };
      };
    };
  };
}
