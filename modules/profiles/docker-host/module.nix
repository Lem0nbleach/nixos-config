{ ... }:

{
  imports = [
    ../../nixos/core/zsh.nix
    ../../nixos/core/ssh.nix
    ../../nixos/core/stylix.nix
    ../../nixos/extra/docker.nix
    ../../nixos/core/qemu-geust-agent.nix
  ];
}
