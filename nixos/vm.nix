{config, pkgs, ... }:

{
  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;

  # Add user to libvirtd group
  users.users.wuluh.extraGroups = [
    #"libvirtd"
    "waydroid"
  ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    virtio-win
    adwaita-icon-theme
    qemu_kvm
    dmidecode
    wineWowPackages.staging
    winetricks
    bottles
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
    waydroid.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
