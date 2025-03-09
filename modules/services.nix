{lib, pkgs, ...}:
{
    services.udisks2.enable = true;
     
 # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

 # Enable CUPS to print documents.
    services.printing.enable = true;

    services.hypridle.enable = false;

    services.ratbagd.enable = true;


   environment.systemPackages = (with pkgs; [
        onedrive
   ]); 
   systemd.user.services.custom-enable-onedrive = {
        enable = false;
        after = ["network.service"];
        description = "...";
        serviceConfig = {
            Type = "simple";
            ExecStart = ''${pkgs.onedrive}/bin/onedrive --monitor'';
            Restart = "on-failure";
        };
        wantedBy = [ "default.target" ]; # starts after login
    };

  # Enable touchpad support (enabled default in most desktopManager).
   services.xserver.libinput.enable = true;


}
