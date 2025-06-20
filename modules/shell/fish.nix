{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if test "$TERM" != "dumb"
        ${pkgs.starship}/bin/starship init fish | source
      end
    '';
  };
}
