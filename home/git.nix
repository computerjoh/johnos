{
  pkgs,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "John Korhel";
        email = "john@korhel.net";
      };
      init.defaultBranch = "main";
    };
  };
}
