{ pkgs, ... }:

{
  # Allowing unfree software
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    pipewire
    wireplumber
    vesktop
    rofi-wayland
    hyprcursor
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-utils
    hyprpaper
    xfce.thunar
    home-manager
    firefox
    git
    mangohud
    protonup
    hyprlock
    hypridle
    swaynotificationcenter
    fastfetch
    zsh
    oh-my-zsh
    waybar
    pavucontrol
    htop
    yazi
    zoxide
    fzf
    zsh-autocomplete
    unzip
    atlauncher
    prismlauncher
    jdk
    grim
    slurp
    wl-clipboard
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    nerdfonts
    font-awesome
    jetbrains-mono
  ];
}
