{ config, lib, pkgs, ... }: {
  networking = {
    # nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "8.8.4.4" ];
    nameservers = [ "127.0.0.1" ];
    hostName = "nixos";
    resolvconf.useLocalResolver = true;
    networkmanager = {
      dns = "none";
      enable = true;
      wifi.backend = "iwd";
      wifi.powersave = false;
    };
    wireless.iwd.enable = true;
  };
}
