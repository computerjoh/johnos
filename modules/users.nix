{ config, pkgs, ... }:

{
  users.users.john = {
    isNormalUser = true;
    description = "john";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
      "input"
      "plugdev"
    ];
    packages = with pkgs; [ kdePackages.kate ];
    shell = pkgs.fish;
  };
}
