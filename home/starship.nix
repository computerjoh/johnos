{
  pkgs,
  config,
  ...
}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };
}
