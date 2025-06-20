{...}: {
  imports = [
    ./home/git.nix
    ./home/firefox.nix
    ./home/vscode.nix
    ./home/plasma.nix
    ./home/starship.nix
    ./home/btop.nix
    ./home/ghostty.nix
  ];
  home.stateVersion = "24.11";
}
