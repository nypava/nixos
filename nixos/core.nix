{ config, pkgs, ... }: {
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/hardware.nix
      ./modules/services.nix
      ./modules/fonts.nix
      ./modules/desktop-env.nix
      ./modules/networking.nix
      ./modules/programs.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup partitions
  fileSystems."/home" = {
   device = "/dev/nvme0n1p8";
    fsType = "ext4";
 };



  # Set your time zone.
  time.timeZone = "Africa/Addis_Ababa";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.marble = {
    home = "/home/marble";
    isNormalUser = true;
    description = "marble";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; 
}
