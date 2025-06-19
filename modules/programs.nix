{
  config,
  pkgs,
  ...
}: {
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if test "$TERM" != "dumb"
        ${pkgs.starship}/bin/starship init fish | source
      end
    '';
  };
  environment.systemPackages = with pkgs; [
    solaar
    rocmPackages.rocm-smi
    (pkgs.btop.override {
      rocmSupport = true;
    })
  ];
}
