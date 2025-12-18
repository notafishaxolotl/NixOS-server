{config, pkgs, ... }:

{
  imports = [ 
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];
  nixpkgs.overlays = [ 
    inputs.nix-minecraft.overlay
  ];

  eula = true;
  enable = true;
  services.minecraft-server = {
  enable = true;
  eula = true;
  openFirewall = true;
  declarative = true;
  
  servers.WuluH.whitelist = {
  xr_lynx = "b55d65b2-3aea-4a29-968c-0a405b5a9d26";
  };
  
  servers.WuluH.operators = {
    # Use https://mcuuid.net/ to get a Minecraft UUID for a username
    xr_lynx = {
      "b55d65b2-3aea-4a29-968c-0a405b5a9d26";
      level = 4;
      bypassesPlayerLimit = true;
    };
  };
  serverProperties = {
    server-port = 43000;
    difficulty = 3;
    gamemode = 1;
    max-players = 5;
    motd = "WuluH";
    white-list = true;
    allow-cheats = false;
  };
  jvmOpts = "-Xms2048M -Xmx4096M";
};

}
