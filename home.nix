{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./home/git.nix
    ./home/firefox.nix
    ./home/vscode.nix
    ./home/plasma.nix
    ./home/starship.nix
    ./home/btop.nix
  ];
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    signal-desktop-bin
    ghostty
    alejandra
    mumble
    prismlauncher
    r2modman
  ];
}
