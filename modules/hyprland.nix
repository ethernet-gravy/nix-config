{pkgs, inputs, ...}:
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
        hyprcursor
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSORS = "1"; # Depreceated in latest hyprland, still keeping it just in case
    };

}
