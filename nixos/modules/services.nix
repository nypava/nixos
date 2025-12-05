{ config, lib, pkgs, ...}: {
  services.printing.enable = true;
  
  services.ntp.enable = true;

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      fallback_resolvers = [ "9.9.9.9:53" "8.8.8.8:53" ];
      log_level = 2;
      listen_addresses = [ "127.0.0.1:53" ];
      server_names = [ "google" ];
      ipv4_servers = true;
      ipv6_servers = false;

      require_dnssec = true;
    };
  };

  # Custom services
  ## kanata
  environment.etc."kanata/config.kbd".source = /${config.users.users.marble.home}/.config/kanata/config.kbd;
  systemd.services.kanata = {
    enable = true;
    description = "kanata";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "notify";
      ExecStart = ''
        ${pkgs.kanata}/bin/kanata -c "/etc/kanata/config.kbd"
      '';
    };
  };

}
