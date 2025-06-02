{
  pkgs,
  inputs,
  ...
}: {
 
  wayland.windowManager.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    plugins = [
      pkgs.hyprland
      pkgs.hyprlandPlugins.hy3
#      pkgs.hyprlandPlugins.hyprscrolling
      inputs.hy3.packages.${pkgs.system}.hy3
#      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
#      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    extraConfig = builtins.readFile ("/home/sarcutus/sarcutusdotfiles/hypr/hyprland.conf");
    };

   wayland.windowManager.sway = {
#     enable = true;
     systemd = {
       enable = true;
       };
     package = pkgs.sway;
     extraConfig = builtins.readFile (./sway/config);
     }; 
  
  # programs.bash.enable = true;
#    iconTheme = {
#      package = (callPackage ./crystal-remix-icon-theme {});
#      name = "Crystal Remix";
#    };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
