{ lib, ... }:

{
  services.hyprpaper.enable = true;

  services.hyprpaper.settings = {
    ipc = true;
    splash = false;

    preload = lib.mkForce "/home/lem0nbleach/.dotfiles/modules/home-manager/window-manager/hyprlock/EYE.jpg";
    wallpaper = lib.mkForce ",/home/lem0nbleach/.dotfiles/modules/home-manager/window-manager/hyprlock/EYE.jpg";
  };
}
