{config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [                                                                                                                                                                               
    lact                                                                                                                                                                                                                                                                                          
  ];                                                                                                                                                                                                                                                                                                                                                 
  systemd.packages = with pkgs; [ lact ];                                                                                                                                                    
  systemd.services.lactd = {
    enable = true; # this is true by default
    wantedBy = [ "multi-user.target" ]; # add this if you want the unit to auto start at boot time 
  };
}
