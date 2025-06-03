{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.git
    pkgs.git-credential-manager
    pkgs.sway
    pkgs.home-manager
    pkgs.wlogout
    pkgs.python312
    pkgs.python313
    pkgs.gcc
    # pkgs.python314
    # pkgs.python311
    # pkgs.python310
    pkgs.vimPlugins.jsonc-vim
    pkgs.vimPluginsUpdater
    pkgs.vimPlugins.mini-statusline
    pkgs.vimPlugins.rust-vim
    pkgs.sphinx
    pkgs.cmake
    pkgs.meson
    pkgs.cpio
    pkgs.zsh-syntax-highlighting
    pkgs.pkg-config
    pkgs.ninja
    pkgs.hyprwayland-scanner
    pkgs.libreoffice
    pkgs.wlroots
    pkgs.chromium
    pkgs.distrobox
    pkgs.distrobox-tui
    pkgs.linuxKernel.packages.linux_xanmod.vmware
    pkgs.jq
    pkgs.jqp
    pkgs.nss
    pkgs.noto-fonts-color-emoji
    pkgs.dbus-broker
    pkgs.ghostty
    pkgs.power-profiles-daemon
    pkgs.texlivePackages.noto-emoji
    pkgs.font-awesome
    pkgs.font-awesome_4
    pkgs.font-awesome_5
    pkgs.rxvt-unicode-unwrapped-emoji
    pkgs.rxvt-unicode-emoji
    pkgs.curl
#    pkgs.hyprland
    pkgs.xwayland
    pkgs.dmidecode
    pkgs.bemenu
    pkgs.waybar
    pkgs.wayland-utils
    pkgs.wezterm
    pkgs.tmux
    pkgs.tmuxp
    pkgs.zsh
    pkgs.fish
    pkgs.nushell
    pkgs.elvish
    pkgs.linuxKernel.kernels.linux_xanmod_latest
#    pkgs.vmware-workstation
#    pkgs.linuxKernel.kernels.linux_xanmod.vmware
    pkgs.open-vm-tools
    pkgs.curl
    pkgs.font-awesome
    pkgs.jetbrains-mono
    # pkgs.nerdfonts
    pkgs.dockbarx
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.mako
    pkgs.lightdm
    pkgs.xfce.xfdesktop
    pkgs.kdePackages.sddm
    pkgs.vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pkgs.easyeffects
    pkgs.nwg-dock-hyprland
    pkgs.wget
    pkgs.kitty
    pkgs.rio
    pkgs.hyprlandPlugins.hy3
    # pkgs.hyprlandPlugins.hyprspace
    pkgs.google-chrome
    pkgs.swaylock-effects
    pkgs.hyprpolkitagent
    pkgs.swaynotificationcenter
    pkgs.swayosd
    pkgs.rmpc
#    pkgs.crystal-dock
    (pkgs.callPackage ./crystal-remix-icon-theme/crystal-remix-icon-theme { })
  ];
}
