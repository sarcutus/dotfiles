{
#   description = "Home Manager configuration of Jane Doe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
  };
};

  outputs =
    { nixpkgs, home-manager, hyprland-plugins, inputs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations.sarcutus = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
    wayland.windowManager.hyprland = {
        enable = true;
        extraConfig = builtins.readFile (/home/sarcutus/.config/hypr/hyprland.conf);
        plugins = [
            inputs.hyprland-plugins.packages.${pkgs.system}.hy3
#         plugin = ${pkgs.hyprlandPlugins.hy3}/lib/lib${pkgs.hyprlandPlugins.hy3.pname}.so
        ]; 

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
};
}
