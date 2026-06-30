{
  config,
  lib,
  pkgs,
  programs,
  ...
}: {
   programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
    # ohMyZsh.plugins = [ "git" ];
    # ohMyZsh.theme = "random";
    syntaxHighlighting.enable = true;
    enableCompletion = true;
  };
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      mangowc = {
        prettyName = "MangoWC";
        comment = "Mango Wayland Compositor under UWSM";
        binPath = "${pkgs.mangowc}/bin/mango";
      };
      hyprland = {
        prettyName = "Hyprland";
        binPath = "${pkgs.hyprland}/bin/hyprland";
      };
    };
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.niri.enable = true;
  programs.steam.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.git.enable = true;
  programs.fish.enable = true;
  programs.firefox.enable = true;
#  programs.waybar.enable = true;
  # programs.hyprland.xwayland.enable = true;
  # programs.hyprland.systemd.setPath.enable = true;
  programs.tmux.enable = true;
  programs.xwayland.enable = true;
  programs.mtr.enable = true;
}
