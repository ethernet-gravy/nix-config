{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        wineWowPackages.stable
        winetricks
        lutris
        heroic
        gamescope
        mangohud
        lm_sensors
        pcsx2
        ns-usbloader
        xorg.xhost
    ];
    programs.steam.enable = true;
    programs.gamemode.enable = true;
}
