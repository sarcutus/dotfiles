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
#    ./vim.nix
#    ./crystal-remix-icon-theme.nix
#    ./cachix.nix
#    ./home.nix
  ];

  swapDevices = [
    {
      device = "/dev/nvme0n1p2";
    }
  ];
  hardware.bluetooth.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  networking.hostName = "Sarcutusdevice02"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

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
  services.desktopManager.plasma6.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;

  hardware.graphics.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    # alsa.enable.support32Bit = true;
  };

  services.power-profiles-daemon.enable = true;

  services.fprintd.enable = true;

  services.fprintd.tod.enable = true;

  #  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090; # (If the vfs0090 Driver does not work, use the following driver)

  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix; # (On my device it only worked with this driver)

  services.dbus.implementation = "broker";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sarcutus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  users.extraUsers.sarcutus = {
    shell = pkgs.bash;
  };

  # Enable the 1Password CLI, this also enables a SGUID wrapper so the CLI can authorize against the GUI app
  programs._1password = {
    enable = true;
  };

  # Enable the 1Passsword GUI with myself as an authorized user for polkit
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "sarcutus" ];
  };

  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
    # ohMyZsh.plugins = [ "git" ];
    # ohMyZsh.theme = "random";
    syntaxHighlighting.enable = true;
  };
  
  programs.steam.enable = true;

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

  services.mpd = {
    enable = true;
    user = "sarcutus";
    musicDirectory = "/home/sarcutus/Music";
    playlistDirectory = "/home/sarcutus/Music/A list of playlists";
    extraConfig = ''
#        audio_output {
#        type "pulse"
#        name "Pulseaudio"
#        server "127.0.0.1" # add this line - MPD must connect to the local sound server
#      }
        audio_output {
        type "pipewire"
        name "Sarcutusdevice PipeWire"
      }
#        audio_output {
#        type "alsa"
#        name "ALSA"    
#      }
    '';
    # Optional: Allow non-localhost connections
    #  network.listenAddress = "any";
    #  network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

  programs.zsh.autosuggestions.enable = true;
  programs.git.enable = true;
  programs.fish.enable = true;
  programs.firefox.enable = true;
  #  programs.uwsm.enable = true;
  #  programs.sway = {
  #    enable = true;
  #    wrapperFeatures.gtk = true;
  #    wrapperFeatures.base = true;
  #  };
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.systemd.setPath.enable = true;
  programs.thunderbird.enable = true;
  programs.tmux.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
  virtualisation.vmware.host.enable = true;

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORM = "wayland";
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.gnome.gnome-keyring.enable = true;

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
