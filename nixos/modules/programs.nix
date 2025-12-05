{config, lib, pkgs, ...}:{
  programs.firefox.enable = true;
  programs.localsend.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # System programs
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    proxychains-ng
    alsa-utils
    dunst
    bind
    hypridle
    hyprpaper
    mekuteriya
    lemurs
    libnotify
  ];

}
