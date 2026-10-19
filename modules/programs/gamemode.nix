{
  pkgs,
  config,
  ...
}: {
  programs.gamemode = {
    enable = true;
    settings.gpu = {
      apply_gpu_optimisations = "accept-responsibility";
      gpu_device = 1; # card1
      amd_performance_level = "high";
    };
  };
}
