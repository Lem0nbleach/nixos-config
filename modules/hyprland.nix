{ lib, config, pkgs, inputs, ... }:

lib.mkMerge [
  {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
    services.xserver.displayManager.lightdm.enable = false;
    programs.hyprlock.enable = true;
    programs.uwsm.enable = true;
    services.displayManager.defaultSession = "hyprland-uwsm";

    environment.systemPackages = [
      pkgs.hyprpaper
      pkgs.hyprcursor
      pkgs.walker
      pkgs.grim
      pkgs.slurp
      pkgs.wluma
      pkgs.mako
      pkgs.brightnessctl
      pkgs.wl-clipboard
      inputs.quickshell.packages.x86_64-linux.default
    ];
  }
  (lib.mkIf config.anchovy {
    services.fprintd.enable = true;
    security.pam.services.hyprlock.fprintAuth = true;
    services.logind.lidSwitch = "suspend";
    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness"
      ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
      ACTION=="add", SUBSYSTEM=="leds", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/leds/%k/brightness"
      ACTION=="add", SUBSYSTEM=="leds", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/leds/%k/brightness"
    '';
  })
]
