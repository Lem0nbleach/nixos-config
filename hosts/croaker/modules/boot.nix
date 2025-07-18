{ pkgs, ... }:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
    };

    kernel.sysctl = { "kernel.split_lock_mitigate" = 0; };

    # Zen Kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # Secure boot utility
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}
