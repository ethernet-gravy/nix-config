{lib, pkgs, pkgs-stable, ...}:
{
    services.udisks2.enable = true;
     
 # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

 # Enable CUPS to print documents.
    services.printing.enable = true;


  services.onedrive = {
      enable = true;
      package = pkgs-stable.onedrive;
  };


  environment.systemPackages = (with pkgs; [
        openssl
  ]);

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


}
