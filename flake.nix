# flake.nix
{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins/main";
      inputs.hyprland.follows = "hyprland";
    };
    # Hyprspace = {
    #   url = "github:KZDKM/Hyprspace";
    #   inputs.hyprland.follows = "hyprland";
    # };
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };
#    crystal-remix-icon-theme = {
#    url = "./crystal-remix-icon-theme";
#      inputs.crystal-remix-icon-theme.follows = "${pkgs.stdenv.hostPlatform.system}.file:///home/sarcutus/sarcutusdotfiles/crystal-remix-icon-theme";
  };
};
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    hyprland-plugins,
    hy3,
    crystal-remix-icon-theme,
    ...
  }: {
    nixosConfigurations = {
      Sarcutusdevice02 = nixpkgs.lib.nixosSystem {
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit self inputs;};
              backupFileExtension = "backup";
              users.sarcutus = ./home.nix;
            };
          }
          ./configuration.nix
          ./packages.nix
          ./hyprland.nix
#          ./crystal-remix-icon-theme/crystal-remix-icon-theme.nix
#          ./hy3.nix
          # ./cachix.nix
          # ./xdg.nix
        ];
        specialArgs = {inherit self inputs;};
      };
    };
  };
}
