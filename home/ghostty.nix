{
  pkgs,
  config,
  ...
}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "0x96f";
      # performable: ctrl+c copies only with a selection, otherwise sends the interrupt
      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
        "ctrl+t=new_tab"
      ];
    };
  };
}
