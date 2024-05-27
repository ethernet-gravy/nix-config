{config, lib, pkgs, ...}:
{
# Enable the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.videoDrivers =[ "modesetting" ];
    services.xserver.resolutions = [
    {
        x = 1920;
        y = 1080;
    }
    ];

    services.xserver.displayManager.startx.enable = true;

    services.xserver.windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
            luarocks
            luadbi-mysql
        ];
    };

    services.xserver.windowManager.dwm.enable = true;
    services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
	src = /home/nakul/.dots/dwm/.config/dwm;
   };

}
