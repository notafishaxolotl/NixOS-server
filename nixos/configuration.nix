{ inputs, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./vm.nix
    ./drives.nix
    ./unstable.nix
    ./zsh.nix
    ./games/mc.nix
    ./media/jelly.nix
  ];

  # Hostname for this system
  networking.hostName = "Nix";
 # Enable NetworkManager for device/network management
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;

  # Set system timezone
  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Keyboard layout
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Enable mounting of drives via udisks2
  services.udisks2.enable = true;
  nixpkgs.config.allowUnfree = true;

  users.users.wuluh = {
    isNormalUser = true;
    description = "Wuluh";
    extraGroups = [ "networkmanager" "wheel" "dialout" ]; # Network admin and sudo
    packages = with pkgs; [];
  };

  # Experimental Nix features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "ca-derivations"
    "auto-allocate-uids"
  ];

  #neovim
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  environment.systemPackages = with pkgs; [
    git
    superfile
    wget
    fastfetch
    trashy
    home-manager 
    bluetui
    direnv
    clang
    gcc
  ];


  fonts.packages = with pkgs; [
    dina-font
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  system.stateVersion = "25.11";
}
