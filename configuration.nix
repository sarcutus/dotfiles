# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  hyprlandPlugins,
  inputs,
  runCommand,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
    ./services.nix
    ./programs.nix
#    ./vim.nix
#    ./crystal-remix-icon-theme.nix
#    ./cachix.nix
  ];
  
  home-manager.users.sarcutus.imports = [./home.nix];

  boot.kernelModules = [ "amdgpu" ];
  
  hardware.amdgpu = {
    opencl.enable = true;
    legacySupport.enable = true;
    initrd.enable = true;
  };

  
  swapDevices = [
    {
      device = "/dev/nvme0n1p2";
    }
  ];
  hardware.bluetooth.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "Sarcutusdevice02"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  # networking.useDHCP = true;
  # systemd.network.enable = true;

  # systemd.network.networks."wlp1s0" = {
  # networkConfig = {
  #   Address = "192.168.1.58/24";
  #   Gateway = "192.168.1.1";
  # };
  #};

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
#    enable = true;
#    config = builtins.readFile (./i3/config);
#  };

  

  
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  nixpkgs.config.allowUnfree = true;

  # Configure keymap in X11

  # Enable CUPS to print documents.

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  
  





  # Enable touchpad support (enabled default in most desktopManager).

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sarcutus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "sudo" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  users.extraUsers.sarcutus = {
    shell = pkgs.zsh;
  };

  # Enable the 1Password CLI, this also enables a SGUID wrapper so the CLI can authorize against the GUI app

  # Enable the 1Passsword GUI with myself as an authorized user for polkit


  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
      "sarcutus"
    ];
  };

  security.polkit.enable = true;
  
  xdg.icons.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
    config.common = {
      default = [ "gtk" ];
    }; 
  };
  # virtualisation.vmware.host.enable = true;
  virtualisation.libvirtd.enable = true;
  

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORM = "wayland";
#    CMAKE_MAKE_PROGRAM = "cmake";
#    CMAKE_C_COMPILER = "gcc";
#    CMAKE_CXX_COMPILER = "gcc";
    DISPLAY = ":0";
    WAYLAND_DISPLAY = ":0";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = import ./packages.nix {inherit pkgs;};

  fonts.packages =
    with pkgs;
    [
      font-awesome
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      # nerd-fonts.JetBrainsMono
      # nerd-fonts.NerdFontsSymbolsOnly
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # started in user sessions.

  # Enable the OpenSSH daemon.



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # nix.settings.experimental-features = [ "nix-command" ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.

  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
