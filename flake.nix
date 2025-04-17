# flake.nix

{

  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
#  }; 
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };

    # hypr-contrib = {
    #   url = "github:hyprwm/hypr-contrib";
    #   inputs.hyprland.follows = "hyprland";
    # };

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        # TODO please change the hostname to your own
        Sarcutusdevice02 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
            }
            ./configuration.nix
            ./home.nix
          ];
        };
      };

      #   homeConfigurations."sarcutus@Sarcutusdevice02" = home-manager.lib.homeManagerConfiguration {
      #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
      #     };
      # make home-manager as a module of nixos
      # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
              
      # TODO replace ryan with your own username
      home-manager.users.sarcutus = import ./home.nix;

      # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix

      # hyprland-plugins = {
      #   url = "github:hyprwm/hyprland-plugins";
      #   inputs.hyprland.follows = "hyprland";
      # };

    };
}
#   description = "Simple way to manage your home dir";

#     nixosModules = rec {
#       simple-manager = import ./module.nix inputs;
#       default = simple-manager;
#     };
