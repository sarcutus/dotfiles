{
  lib,
  config,
  services,
  pkgs,
  inputs,
  ...
}: {
  security.pam.services.sarcutus.googleAuthenticator.enable = true;
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    # alsa.enable.support32Bit = true;
  };

  services.tlp = {
  enable = true;
  settings = {
    START_CHARGE_THRESH_BAT0 = 60; # Start charging below 60%
    STOP_CHARGE_THRESH_BAT0 = 80;  # Stop charging above 80%
  };
};
services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "tuigreet --remember --remember-user-session";
        user = "sarcutus";
      };
    };
  };
  services.dbus.implementation = "broker";
  services.libinput.enable = true;
  services.mpd = {
    enable = true;
    user = "sarcutus";
    settings = {
      music_directory = "/home/sarcutus/Music";
      playlist_directory = "/home/sarcutus/Music/A list of playlists";
      # log_file = "/var/log/mpd.log";
      audio_output = [
        {
          type = "pipewire";
          name = "Sarcutusdevice PipeWire output";
        }
      ];
    };
  };
    systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
  # services.polkit.enable = true;
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
