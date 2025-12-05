{config, lib, pkgs, ...} : {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
  };
  #
  # services.displayManager = {
  #   enable = true;
  #   defaultSession = "hyprland";
  #   execCmd = lib.mkForce "${pkgs.lemurs}/bin/lemurs --no-log";
  # };
  services.displayManager.ly.enable = true;
  # Enable wlr xdg portal
  xdg.portal.wlr.enable = true; 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.hyprland.enable = true;

  programs.waybar.enable = true;
}
