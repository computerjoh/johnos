{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./home/fish.nix
    ./home/git.nix
    ./home/firefox.nix
    ./home/plasma.nix
    ./home/starship.nix
    ./home/btop.nix
    ./home/ghostty.nix
    ./home/vesktop.nix
    ./home/helix.nix
    ./home/vscode.nix
    ./home/mangohud.nix
  ];
  home.stateVersion = "24.11";
  home.shell.enableFishIntegration = true;
}
