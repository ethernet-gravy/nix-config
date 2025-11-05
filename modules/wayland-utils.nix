{ config, lib, pkgs, inputs, ... }:

{

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = {};
  services.upower.enable = true;
  environment.systemPackages = with pkgs; [
    mako
    inputs.stasis.packages.${pkgs.system}.stasis
    inputs.noctalia.packages.${pkgs.system}.default
    rofi
    walker
    satty
    cliphist
    swaybg
    pywal
    ghostty
    xdg-desktop-portal-gnome
    wl-clipboard
    brightnessctl
    libnotify
    lisgd # for arbitrary touchscreen gestures.
    hyprlock
  ];
}
