{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        wine
        winetricks
        lutris
        heroic
        mangohud
    ];
    programs.steam.enable = true;
}
