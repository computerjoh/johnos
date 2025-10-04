{
  pkgs,
  config,
  ...
}: {
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = {
      full = true;
      fps_limit = 245;
    };
  };
}
