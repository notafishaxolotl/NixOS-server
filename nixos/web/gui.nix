{ inputs, config, pkgs, ... }:

{
  imports = [
    ./homepage.nix
    ./ttyd.nix
    ./tailscale.nix
  ];
}
