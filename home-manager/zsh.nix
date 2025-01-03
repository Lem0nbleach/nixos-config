{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
      ];
    };

    initExtra = ''eval "$(zoxide init zsh)"'';

    shellAliases = {
      nrb = "sudo nixos-rebuild switch --flake .";
    };
  };

}

