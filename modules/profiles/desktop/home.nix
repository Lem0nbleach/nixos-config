{ inputs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "lem0nbleach";
    homeDirectory = "/home/lem0nbleach";
    stateVersion = "24.05";
  };

  imports = [
    # Home manager
    inputs.nixvim.homeManagerModules.nixvim
    inputs.anyrun.homeManagerModules.anyrun
    inputs.nvf.homeManagerModules.default
    inputs.schizofox.homeManagerModules.default
    ../../home-manager/kitty.nix
    ../../home-manager/zsh.nix
    ../../home-manager/window-manager/hyprland.nix
    ../../home-manager/window-manager/waybar.nix
    ../../home-manager/git.nix
    ../../home-manager/nvf.nix
    ../../home-manager/window-manager/hyprpaper.nix
    ../../home-manager/window-manager/hyprlock.nix
    ../../home-manager/window-manager/hypridle.nix
    ../../home-manager/anyrun.nix
    ../../home-manager/rofi.nix
    ../../home-manager/obs.nix
    ../../home-manager/zoxide.nix
    ../../home-manager/schizofox.nix
  ];
}
