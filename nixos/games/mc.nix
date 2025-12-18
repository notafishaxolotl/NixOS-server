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

  servers.WuluH.serverProperties = {
    server-port = 43000;
    difficulty = 2;
    gamemode = 0;
    max-players = 5;
    motd = "WuluH";
    white-list = true;
    allow-cheats = false;
  };

  servers.WuluH.operators = {
    # Use https://mcuuid.net/ to get a Minecraft UUID for a username
    xr_lynx = {
      "b55d65b2-3aea-4a29-968c-0a405b5a9d26";
      level = 4;
      bypassesPlayerLimit = true;
    };
  };

  servers.WuluH.whitelist = {
  xr_lynx = "b55d65b2-3aea-4a29-968c-0a405b5a9d26";
  };
  
  
  

}
