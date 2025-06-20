{pkgs, ...}: let
  btopWithRocm = pkgs.btop.override {
    rocmSupport = true;
  };
in {
  programs.btop = {
    enable = true;
    package = btopWithRocm;
    settings = {
      color_theme = "Default";
      theme_background = false;
    };
  };

  home.packages = [
    pkgs.rocmPackages.rocm-smi
  ];
}
