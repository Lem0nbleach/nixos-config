{ ... }:

{
  services.hyprpaper.enable = true;

  services.hyprpaper.settings = {
    ipc = true;
    splash = true;

    preload = "/home/lem0nbleach/.dotfiles/home-manager/modules/window-manager/wallpaper/EYE.jpg";
    wallpaper = ", /home/lem0nbleach/.dotfiles/home-manager/modules/window-manager/wallpaper/EYE.jpg";
  };
}