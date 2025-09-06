{pkgs, inputs, ...}:
{

    programs.hyprland = {
        enable = true;
        withUWSM = false;
    };
    environment.systemPackages = with pkgs; [
        kitty 
        waybar
        swaybg
        pywal
        hyprpaper
        hyprlock
        inputs.iio-hyprland.packages.${pkgs.system}.default
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
        kdePackages.qtwebview
    ];
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        AQ_NO_HARDWARE_CURSORS = "1"; # Depreceated in latest hyprland, still keeping it just in case
    };
    security.polkit.enable = true;
    
    #services.gnome.gnome-keyring.enable = true;
    #security.pam.services.hyprland.enableGnomeKeyring = true;


}
