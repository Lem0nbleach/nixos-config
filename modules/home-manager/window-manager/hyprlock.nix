{ lib, ... }:

{
  programs.hyprlock.enable = true;

  programs.hyprlock.settings = {

    general = {
      no_fade_in = false;
      grace = 0;
      disable_loading_bar = false;
    };

    background = {
      monitor = "";
      path = lib.mkForce "/home/lem0nbleach/.dotfiles/modules/home-manager/window-manager/hyprlock/EYE.jpg";
      blur_passes = 2;
      contrast = 0.8916;
      brightness = 0.8172;
      vibrancy = 0.1696;
      vibrancy_darkness = 0.0;
    };


    input-field = {
      monitor = "";
      size = "250, 60";
      outline_thickness = 2;
      dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
      dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
      dots_center = true;
      outer_color = lib.mkForce "rgba(0, 0, 0, 0)";
      inner_color = lib.mkForce "rgba(100, 114, 125, 0.5)";
      font_color = lib.mkForce "rgb(200, 200, 200)";
      fade_on_empty = false;
      font_family = "SF Pro Display";
      placeholder_text = ''<i><span foreground="##ffffff99">Hi, $USER</span></i>'';
      hide_input = false;
      position = "0, -290";
      halign = "center";
      valign = "center";
    };
  };

  programs.hyprlock.extraConfig = ''
# Hour-Time
label {
    monitor =
    text = cmd[update:1000] echo -e "$(date +"%H")"
    color = rgba(255, 185, 0, .6)
    font_size = 180
    font_family = Alpha Slab One
    position = 0, 300
    halign = center
    valign = center
}

# Minute-Time
label {
    monitor =
    text = cmd[update:1000] echo -e "$(date +"%M")"
    color = rgba(255, 255, 255, .6)
    font_size = 180
    font_family = Alpha Slab One
    position = 0, 75
    halign = center
    valign = center
}

# Day-Date-Month
label {
    monitor =
    text = cmd[update:1000] echo "<span color='##ffffff99'>$(date '+%A, ')</span><span color='##ffb90099'>$(date '+%d %B')</span>"
    font_size = 30
    font_family = SF Pro Display
    position = 0, -80
    halign = center
    valign = center
}

# USER
#label {
#    monitor =
#    text = 
#    color = rgba(255, 255, 255, .65)
#    font_size = 80
#    position = 0, -180
#    halign = center
#    valign = center
#}
  '';
}
