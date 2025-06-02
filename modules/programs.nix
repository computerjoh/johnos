{
  config,
  pkgs,
  ...
}: {
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    solaar
    spotify
    rocmPackages.rocm-smi
    (pkgs.btop.override {
      rocmSupport = true;
    })
  ];
}
