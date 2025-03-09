{pkgs, config, ...}:
{
    services = {
        syncthing = {
            enable = true;
            user = "nakul";
            openDefaultPorts = true;
            dataDir = "/home/nakul/";
            configDir = "/home/nakul/.config/syncthing";
        };
    };

   environment.systemPackages = with pkgs; [
            stc-cli
   ];
}
