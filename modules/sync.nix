{pkgs, config, ...}:
{
    services = {
        syncthing = {
            enable = true;
            openDefaultPorts = true;
        };
    };

   environment.systemPackages = with pkgs; [
            stc-cli
   ];
}
