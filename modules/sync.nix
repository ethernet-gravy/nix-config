{pkgs, config, ...}:
{
    services = {
        syncthing = {
            enable = true;
            group = "nakul";
            user = "nakul";
            configDir = "/home/nakul/.config/syncthing";   # Folder for Syncthing's settings and keys
        };
    };
}
   networking.firewall.allowedTCPPorts = [ 8384 22000 ];
   networking.firewall.allowedUDPPorts = [ 22000 21027 ];
   environment.systemPackages = with pkgs; [
            stc-cli
   ]
