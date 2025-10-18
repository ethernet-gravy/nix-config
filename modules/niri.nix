{pkgs, ...}:
{

  programs.niri.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = {};

  environment.systemPackages = with pkgs; [ swaylock mako swayidle xwayland-satellite ];

}
