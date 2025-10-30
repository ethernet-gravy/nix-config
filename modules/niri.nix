{pkgs, ...}:
{

  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [ swaylock swayidle xwayland-satellite ];

}
