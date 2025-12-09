{
  pkgs,
  inputs,
  ...
}: {
 
  wayland.windowManager.hyprland = {
#    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    plugins = [
      pkgs.hyprland
#      pkgs.hyprlandPlugins.hy3
      pkgs.hyprlandPlugins.hyprscrolling
      inputs.hy3.packages.${pkgs.system}.hy3
#      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
#      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    extraConfig = builtins.readFile (./hypr/hyprland.conf);
    };

   wayland.windowManager.sway = {
#     enable = true;
     systemd = {
       enable = true;
       };
     package = pkgs.sway;
     extraConfig = builtins.readFile (./sway/config);
   };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    extraConfig = builtins.readFile (./i3/config);
  };

  programs.vim = {
     enable = true;
     plugins = with pkgs.vimPlugins; [ vim-airline ];
     };

  # programs.bash.enable = true;

  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;  # Optional: Enable Bash integration
    enableZshIntegration = true;    # Optional: Enable Zsh integration
    package = pkgs.wezterm;         # Specify the WezTerm package
#    extraConfig = builtins.readFile (./wezterm/wezterm.lua);
  };
  
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };
  
#  programs.rmpc.config = {
#    extraConfig = builtins.readFile (./rmpc/config_nord.ron);
#  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
