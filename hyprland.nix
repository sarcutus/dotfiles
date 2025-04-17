# hyprland.nix
{ pkgs, lib, config, inputs, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    package = pkgs.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".hy3
    ];
