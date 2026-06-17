# flake.nix
{
  description = "NixOS configuration";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "git+https://github.com/hercules-ci/flake-parts";
    flake-utils.url = "git+https://github.com/numtide/flake-utils";
    nixgl.url = "git+https://github.com/nix-community/nixGL";
    home-manager = {
      url = "git+https://github.com/nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "git+https://github.com/DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#    hyprland = {
#      url = "github:hyprwm/Hyprland/main";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
#    hyprland-plugins = {
#      url = "github:hyprwm/hyprland-plugins/main";
#      inputs.hyprland.follows = "hyprland";
#    };
#    Hyprspace = {
#      url = "github:KZDKM/Hyprspace";
#      inputs.hyprland.follows = "hyprland";
#    };
#    hy3 = {
#      url = "github:outfoxxed/hy3/master";
#      inputs.hyprland.follows = "hyprland";
#    };
#    hy3 = {
#     url = "github:Daholli/hy3";
#      inputs.hyprland.follows = "hyprland";
#    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#    wezterm = {
#      url = "git+https://github.com/wezterm/wezterm?dir=nix";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
};  
  outputs = inputs @ {
    self,
    nixgl,
    nixpkgs,
    flake-parts,
    home-manager,
    mangowc,
    noctalia,
#    wezterm,
#    hyprland,
#    hyprland-plugins,
#    hy3,
    ...
  }: {
    nixosConfigurations = {
      Sarcutusdevice02 = nixpkgs.lib.nixosSystem {
        modules = [
#          inputs.mangowc.nixosModules.mango
#          {
#            programs.mango.enable = true;
#          }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
#              windowManager.mangowc = {
#                enable = true;
#                extraConfig = builtins.readFile (./mango/config.conf);
#                autostart.sh = ''
#                  waybar &
#                  hyprpaper &
#                '';
#              };
              extraSpecialArgs = {inherit self inputs;};
              backupFileExtension = "backup";
              users.sarcutus = ./home.nix;
            };
          }
          ./noctalia.nix
          ./configuration.nix
          ./packages.nix
#          ./vim.nix
#          ./hyprland.nix
#          ./crystal-remix-icon-theme.nix
#          ./hy3.nix
          # ./cachix.nix
          # ./xdg.nix
        ];
        specialArgs = {inherit self inputs;};
      };
    };
  };
}
