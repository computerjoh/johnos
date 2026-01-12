{pkgs, ...}: {
  users.users.john = {
    isNormalUser = true;
    description = "john";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "plugdev"
      "docker"
    ];
    shell = pkgs.fish;
  };
}
