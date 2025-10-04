{
  pkgs,
  config,
  ...
}: {
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
  };
}
