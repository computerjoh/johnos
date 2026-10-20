{
  pkgs,
  config,
  ...
}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraPackages = with pkgs; [
      gamemode
      mangohud
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
