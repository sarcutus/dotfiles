{
   inputs,
   pkgs,
   ...
}: {

   programs.hy3 = {
     enable = true;
     package = inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3;
     portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
   };
}

