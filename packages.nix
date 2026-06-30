{
  config,
  pkgs, 
  ...
}: {
  environment.systemPackages = [
    pkgs.git
    pkgs.git-credential-manager
    pkgs.lazygit
    pkgs.yaziPlugins.lazygit
    pkgs.vimPlugins.lazygit-nvim
    pkgs.sway
    pkgs.home-manager
    pkgs.mission-center
    # pkgs.lightdm
    pkgs.eog
#    pkgs.noctalia-qs
    pkgs.gruvbox-dark-gtk
#    pkgs.redshift
#    pkgs.noctalia-shell
    pkgs.tuigreet
    pkgs.proton-vpn
    pkgs.code-cursor
    pkgs.blackbox-terminal
    pkgs.libvirt
    pkgs.themechanger
    pkgs.borgmatic
    pkgs.blueman
    pkgs.bluetuith
    pkgs.nwg-look
    pkgs.nyx
    pkgs.yazi
    pkgs.ut1999
    pkgs.xwayland-satellite
    pkgs.gnome-weather
    pkgs.geoclue2
    pkgs.gnome-characters
    pkgs.tor
    pkgs.easyeffects
#    pkgs.regreet
    pkgs.claude-code
    pkgs.codeblocks
    pkgs.python314Packages.python-docx
    pkgs.cmus
    pkgs.xterm
    pkgs.fzf
    pkgs.hyprsunset
    pkgs.themechanger
    pkgs.pay-respects
    pkgs.most
    pkgs.playerctl
    pkgs.mtr
    pkgs.zoxide
    pkgs.egl-wayland
    pkgs.wayland-protocols
    pkgs.wayland
    pkgs.libxkbcommon
    pkgs.libinput
    pkgs.libdrm
    pkgs.wlogout
    pkgs.mousam
    pkgs.fortune
    pkgs.cyme
    pkgs.cheese
    pkgs.guvcview
    pkgs.qmplay2
    pkgs.hyprlauncher
    pkgs.weechat
    pkgs.hwinfo
    # pkgs.python312
    pkgs.python314
#    pkgs.niri
    pkgs.bottom
    pkgs.v4l-utils
    pkgs.gcc
    pkgs.i3
    pkgs.hypr
    pkgs.mesa
    pkgs.cava
    # pkgs.polybarFull
    pkgs.ocs-url
    pkgs.networkmanager
    pkgs.rPackages.rust
    pkgs.rustc
    pkgs.python314
    # pkgs.python311
    # pkgs.python310
    # pkgs.cantata
    # pkgs.hyprland
    # pkgs.hyprlandPlugins.hy3
    pkgs.dmenu
    pkgs.xorg-server
    pkgs.rocmPackages.clr
    pkgs.rocmPackages.rocm-smi
    pkgs.btop 
    pkgs.google-authenticator
    pkgs.clamav
#    pkgs.telegram-desktop
    pkgs.iotop
    pkgs.mpc
    pkgs.dwl
    pkgs.zbar
    pkgs.qrrs
    pkgs.bitwarden-desktop
    pkgs.bitwarden-cli
    pkgs.obsidian
    pkgs.vimPlugins.jsonc-vim
    pkgs.vimPluginsUpdater
    pkgs.vimPlugins.mini-statusline
    pkgs.vimPlugins.rust-vim
    pkgs.vivaldi
    pkgs.nwg-drawer
    pkgs.nwg-dock
    pkgs.sphinx
    pkgs.cmake
    pkgs.meson
    pkgs.cpio
    pkgs.zsh-syntax-highlighting
    pkgs.pavucontrol
    pkgs.pkg-config
    pkgs.ninja
    pkgs.hyprwayland-scanner
    pkgs.libreoffice
    pkgs.wlroots
    pkgs.swaybg
    # pkgs.chromium
    pkgs.distrobox
    pkgs.distrobox-tui
    pkgs.discord
#    pkgs.linuxKernel.packages.linux_xanmod.vmware
    pkgs.jq
    pkgs.jqp
    pkgs.nss
    pkgs.noto-fonts-color-emoji
    pkgs.dbus
    pkgs.dbus-broker
    pkgs.ghostty
    pkgs.power-profiles-daemon
    pkgs.upower
    pkgs.upower-notify
    pkgs.xeyes
    # pkgs.texlivePackages.noto-emoji
    pkgs.font-awesome
    pkgs.font-awesome_4
    pkgs.font-awesome_5
    pkgs.rxvt-unicode-unwrapped-emoji
    pkgs.rxvt-unicode-emoji
    pkgs.curl
    pkgs.nautilus
    pkgs.hyprland-qt-support
    pkgs.xwayland
    pkgs.dmidecode
    pkgs.bemenu
    pkgs.waybar
    pkgs.wayland-utils
    pkgs.zsh
    pkgs.fish
    # pkgs.nushell
    # pkgs.elvish
#    pkgs.linuxKernel.kernels.linux_xanmod_latest
#    pkgs.vmware-workstation
#    pkgs.linuxKernel.kernels.linux_xanmod.vmware
    pkgs.open-vm-tools
    pkgs.curl
    pkgs.font-awesome
    pkgs.jetbrains-mono
    # pkgs.nerdfonts
    # pkgs.dockbarx
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
#    pkgs.mako
    # pkgs.xfdesktop
    # pkgs.kdePackages.sddm
    pkgs.vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pkgs.neovim
    pkgs.easyeffects
    pkgs.nwg-dock-hyprland
    pkgs.wget
    pkgs.kitty
    pkgs.rio
    # pkgs.hyprlandPlugins.hyprspace
    # pkgs.google-chrome
    pkgs.swaylock-effects
    pkgs.hyprpolkitagent
#    pkgs.swaynotificationcenter
    pkgs.swayosd
    pkgs.rmpc
    (pkgs.callPackage ./crystal-remix-icon-theme.nix { })
    pkgs.dconf-editor
    pkgs.kdePackages.systemsettings
    pkgs.kdePackages.qt6ct
    pkgs.kdePackages.kde-gtk-config
    pkgs.kdePackages.plasma-desktop
    pkgs.kdePackages.knewstuff
    pkgs.kdePackages.kdeplasma-addons
    pkgs.kdePackages.layer-shell-qt
    pkgs.shellcheck
    pkgs.xsettingsd
    pkgs.kdePackages.plasma-workspace
    pkgs.kdePackages.plasma-wayland-protocols
    pkgs.kdePackages.libplasma
    pkgs.kdePackages.kcoreaddons
    # pkgs.libsForQt5.qt5ct
    pkgs.hyprland-qt-support
    pkgs.kdePackages.sddm-kcm
    pkgs.hyprpaper
    pkgs.brightnessctl
    pkgs.blesh
    pkgs.tor-browser
    pkgs.proton-authenticator
    pkgs.fastfetch
    pkgs.wofi
    pkgs.crystal-dock
    pkgs.foot
    pkgs.hypridle
    pkgs.swayidle
    pkgs.microsoft-edge
    pkgs.hyprlock
    pkgs.mangowc
#    pkgs.wezterm
    pkgs.mpd-mpris
    pkgs.qemu_full
    pkgs.qemu_kvm
    pkgs.virt-manager
    pkgs.spice-gtk
  ];
}
