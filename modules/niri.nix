{pkgs, ...}:
{

  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [ 
    xwayland-satellite 
    rose-pine-cursor
  ];

}
