{pkgs, ...}:
{

    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [
        kitty 
        waybar
        swaybg
        pywal
        hyprpaper
        hyprlock
        hypridle
        hyprpicker
    ];
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSORS = "1";
    };
}
