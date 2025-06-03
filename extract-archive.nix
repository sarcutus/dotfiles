{ 
self,
pkgs,
...
}@args: {

environment.systemPackages = let
  crystal-remix-icon-theme = pkgs.runCommand "extract-archive" {
    src = ./crystal-remix-icon-theme/crystal-remix-icon-theme-2.6.tar.gz;
  } ''
  mkdir --parents $out/share/icons
  tar -xzf $src -C $out/share/icons
  '';
in
  crystal-remix-icon-theme;

flake = false;
}
