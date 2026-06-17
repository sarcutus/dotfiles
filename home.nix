{
  pkgs,
  inputs,
  ...
}: {
 
#   wayland.windowManager.hyprland = {
#     enable = true;
    # set the flake package
#     package = pkgs.hyprland;
    # make sure to also set the portal package, so that they are in sync
#     portalPackage = pkgs.xdg-desktop-portal-hyprland;
#     plugins = [
#     pkgs.hyprland
#      pkgs.hyprlandPlugins.hy3
#      pkgs.hyprlandPlugins.hyprscrolling
#      inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3
#      inputs.hyprland-plugins.packages.${pkgs.hostPlatform.system}.hyprbars
#      inputs.Hyprspace.packages.${pkgs.hostPlatform.system}.Hyprspace
#     ];
#    extraConfig = builtins.readFile (./hypr/hyprland.conf);
#  };

#  wayland.windowManager.mango = {
#    enable = true;
#    extraConfig = builtins.readFile (./mango/config.conf);
#    autostart.sh = ''
#      waybar &
#      hyprpaper &
#    '';
#  };

   wayland.windowManager.sway = {
#     enable = true;
     systemd = {
       enable = true;
       };
     package = pkgs.sway;
     extraConfig = builtins.readFile (./sway/config);
  };

#   services.swayosd = {
#     enable = true;
#  };

   xsession.windowManager.i3 = {
#    enable = true;
    package = pkgs.i3;
#    extraConfig = builtins.readFile (./i3/config);
  };

  programs.vim = {
     enable = true;
     plugins = with pkgs.vimPlugins; [ vim-airline ];
     };

  programs.eza = {
    enable = true;
    git = true;
    enableBashIntegration = true;
    enableNushellIntegration = false; # We don't want to overwrite nushell's native ls
    enableZshIntegration = true;
    enableFishIntegration = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
      "--icons=auto"
    ];
  };
  home.shellAliases.tree = "eza --tree";

  # programs.bash.enable = true;

  services.mpd-mpris.enable = true;
  
#  programs.wezterm = {
#    enable = true;
#    enableBashIntegration = true;  # Optional: Enable Bash integration
#    enableZshIntegration = true;    # Optional: Enable Zsh integration
#    package = inputs.wezterm.packages.${pkgs.stdenv.hostPlatform.system}.default;
#    extraConfig = builtins.readFile (./.config/wezterm/wezterm.lua);
#  };
  
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };
  
  programs.rmpc = {
    enable = true;
    # extraConfig = builtins.readFile (./.config/rmpc/config_nord.ron);
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
