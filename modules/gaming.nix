{pkgs, pkgs-stable, ...}:
{
    environment.systemPackages = (with pkgs; [
        wineWowPackages.stable
        winetricks
        lutris
        protontricks
        heroic
        gamescope
        mangohud
        lm_sensors
        pcsx2
        ns-usbloader
        xorg.xhost
    ])
    ++
    (with pkgs-stable; [
        #minecraft
    ]);
    programs.steam.enable = true;
    programs.gamemode.enable = true;
}
