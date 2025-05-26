{
  config,
  pkgs,
  ...
}: {
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
    shell = pkgs.fish;
  };
}
