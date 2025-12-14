{config, pkgs, ... }:

{
  services.minecraft-server = {
  enable = true;
  eula = true;
  openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
  declarative = true;
  whitelist = {
    # Use https://mcuuid.net/ to get a Minecraft UUID for a username
    xr_lynx = "b55d65b2-3aea-4a29-968c-0a405b5a9d26";
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
