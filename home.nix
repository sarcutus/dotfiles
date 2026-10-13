{
  pkgs,
  inputs,
  config,
  ...
}:
{

  #   wayland.windowManager.hyprland = {
  #     enable = true;
  # set the flake package
  #     package = pkgs.hyprland;
  # make sure to also set the portal package, so that they are in sync
  #     portalPackage = pkgs.xdg-desktop-portal-hyprland;
  #     plugins = [
  #     pkgs.hyprland
  #      pkgs.hyprlandPlugins.hy3
  #      pkgs.hyprlandPlugins.hyprscrolling
  #      inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3
  #      inputs.hyprland-plugins.packages.${pkgs.hostPlatform.system}.hyprbars
  #      inputs.Hyprspace.packages.${pkgs.hostPlatform.system}.Hyprspace
  #     ];
  #    extraConfig = builtins.readFile (./hypr/hyprland.conf);
  #  };

  #  wayland.windowManager.mango = {
  #    enable = true;
  #    extraConfig = builtins.readFile (./mango/config.conf);
  #    autostart.sh = ''
  #      waybar &
  #      hyprpaper &
  #    '';
  #  };

  wayland.windowManager.sway = {
    #     enable = true;
    systemd = {
      enable = true;
    };
    package = pkgs.sway;
    extraConfig = builtins.readFile (./sway/config);
  };

  #   services.swayosd = {
  #     enable = true;
  #  };

  xsession.windowManager.i3 = {
    #    enable = true;
    package = pkgs.i3;
    #    extraConfig = builtins.readFile (./i3/config);
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-airline ];
  };

  programs.cava.enable = true;
  programs.cava.package = pkgs.cava;

  programs.eza = {
    enable = true;
    git = true;
    enableBashIntegration = true;
    enableNushellIntegration = false; # We don't want to overwrite nushell's native ls
    enableZshIntegration = true;
    enableFishIntegration = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
      "--icons=auto"
    ];
  };
  home.shellAliases.tree = "eza --tree";

  # programs.bash.enable = true;

  services.mpd-mpris.enable = true;

#  gtk = {
#    enable = true;
#    gtk4 = {
#      enable = true;
#      theme.name = "gruvbox-dark";
#    };
#  };
  
  programs.wezterm = {
    enable = true;
    #    enableBashIntegration = true;  # Optional: Enable Bash integration
    enableZshIntegration = true; # Optional: Enable Zsh integration
    package = inputs.wezterm.packages.${pkgs.stdenv.hostPlatform.system}.default;
    extraConfig = '' 
         -- config_builder() gives you nicer error messages than a plain table;
         -- falls back to {} on older WezTerm versions that lack it.
         local config = wezterm.config_builder and wezterm.config_builder()

         --------------------------------------------------------------------
         -- Persistent mux session (Unix domain)
         --------------------------------------------------------------------
         -- Spins up a background mux server that owns your shells independently
         -- of the GUI window, so closing WezTerm (or it crashing) doesn't kill
         -- anything running inside it.
         config.unix_domains = {
           { name = 'unix' },
         }

         -- Auto-connect to that domain on startup -- equivalent to always
         -- launching with `wezterm connect unix`. Remove this line if you'd
         -- rather connect manually with `wezterm connect unix` when you want to.
         config.default_gui_startup_args = { 'connect', 'unix' }

         --------------------------------------------------------------------
         -- Launch straight into Zellij
         --------------------------------------------------------------------
         -- `attach -c main` attaches to a session named "main" if one exists
         -- (including resurrecting an exited one), or creates it if not.
         --
         -- IMPORTANT: use the ABSOLUTE path to the zellij binary, not just
         -- "zellij". WezTerm execs default_prog directly without going through
         -- a login shell, so it won't necessarily see your normal PATH -- this
         -- is especially common on NixOS, where a GUI-launched WezTerm process
         -- may not have ~/.nix-profile/bin (or similar) on PATH at all.
         --
         -- Find your path with: which zellij
         -- config.default_prog = { '${pkgs.zellij}/bin/zellij', 'attach', '-c', 'main' }

         --------------------------------------------------------------------
         -- A few everyday defaults -- change or delete any of these freely
         --------------------------------------------------------------------
         config.font_size = 12.0
         config.hide_tab_bar_if_only_one_tab = false
         config.window_close_confirmation = 'NeverPrompt'
         config.scrollback_lines = 500

         return config
  '';
};

  programs.zellij = {
    enable = true;
    package = pkgs.zellij;  # pin this to a specific nixpkgs input/overlay if you want it to never move
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  programs.rmpc = {
    enable = true;
    # extraConfig = builtins.readFile (./.config/rmpc/config_nord.ron);
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
