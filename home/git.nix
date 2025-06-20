{ ...
}: {
  programs.git = {
    enable = true;
    userName = "John Korhel";
    userEmail = "john@korhel.net";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
