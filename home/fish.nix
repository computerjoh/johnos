{
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if test "$TERM" != "dumb"
        ${pkgs.starship}/bin/starship init fish | source
      end
    '';
    # Start claude inside the repo's dev shell when there's a flake here.
    functions.claude = {
      wraps = "claude";
      body = ''
        if not set -q IN_NIX_SHELL; and test -f flake.nix
            nix develop -c claude $argv
        else
            command claude $argv
        end
      '';
    };
  };
}
