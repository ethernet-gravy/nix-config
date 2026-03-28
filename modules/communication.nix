{pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        zoom-us
        signal-desktop
    ];
}
