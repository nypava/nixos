{ config, lib, pkgs, ...}: {
  services.printing.enable = true;
  
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
