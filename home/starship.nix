{
  config,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };
}
