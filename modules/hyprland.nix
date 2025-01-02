{pkgs, inputs, ...}:
{

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };
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
        cliphist
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
        kdePackages.qtwayland
        kdePackages.qtsvg
        kdePackages.kio-fuse
        kdePackages.kio-extras
        kdePackages.breeze-icons
    ];
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSORS = "1"; # Depreceated in latest hyprland, still keeping it just in case
    };

}
