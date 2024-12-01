{ lib,  ... }:

{
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 2560x1440@165, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, -1100x1440, 1"
    ];
    
    "$terminal" = "kitty";
    "$fileManager" = "kitty -e yazi";
    "$menu" = "rofi";
    "$mainMod" = "SUPER";

    exec-once = [
      "hyprctl setcursor Bibata-Modern-Ice 24"
      "hyprlock & hyprpaper & hypridle & swaync & waybar"
      #"logseq & vesktop"
      "[workspace special:scratchPad] appimage-run ~/Appimage/Logseq-linux-x64-0.10.9.AppImage"
      "[workspace special:scratchPad] vesktop"
      "fcitx5 -d -r"
      "fcitx5-remote -r"
      "[workspace 1] steam"
    ];

    env = [
      "HYPRCURSOR_THEME, Bibata-Modern-Ice"
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      "col.active_border" = lib.mkForce "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = lib.mkForce "rgba(595959aa)";
      resize_on_border = false;
      allow_tearing = true;
      layout = "deindle";
    };

    workspace = [
      "name:Secondary, monitor:HDMI-A-1, default:true"
      "1, monitor:DP-3, default:true"
    ];

    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = lib.mkForce "rgba(1a1a1aee)";

      blur = {
        enabled = true;
	size = 3;
	passes = 1;
	vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
	"windowsOut, 1, 7, default, popin 80%"
	"border, 1, 10, default"
	"borderangle, 1, 8, default"
	"fade, 1, 7, default"
	"workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master.new_status = "master";

    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = false;
    };

    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = 1;

      sensitivity = -0.5;
      touchpad = {
        natural_scroll = false;
      };
    };

    gestures = {
      workspace_swipe = false;
    };

    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };

    bind = [
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive,"
      #"$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu -show drun"
      #"$mainMod, P, pseudo, # dwindle"
      #"$mainMod, J, togglesplit, # dwindle"
      "$mainMod, F, fullscreen"
      "$mainMod, K, exec, hyprctl kill"
      "$mainMod, L, exec, hyprlock"
      "$mainMod, Z, exec, appimage-run ~/Appimage/Logseq-linux-x64-0.10.9.AppImage"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      #"$mainMod, 7, workspace, 7"
      #"$mainMod, 8, workspace, 8"
      #"$mainMod, 9, workspace, 9"
      #"$mainMod, 0, workspace, 10"
      "$mainMod, S, togglespecialworkspace, scratchPad"
      "$mainMod, X, workspace, name:Secondary"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"
      "$mainMod SHIFT, S, movetoworkspace, special:scratchPad"
      "$mainMod SHIFT, X, movetoworkspace, name:Secondary"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      '', Print, exec, grim -g "$(slurp -d)" - | wl-copy''
      "$mainMod, H, exec, hyprpicker -a -f hex"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    windowrulev2 = [
      "opacity 0.97 0.9,initialClass:^(kitty)$,initialTitle:^(kitty)$"
      "suppressevent maximize, class:.*"
    ];

    windowrule = [
      "pseudo, fcitx"
    ];
  };
}
