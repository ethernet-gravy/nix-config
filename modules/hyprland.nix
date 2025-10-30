{pkgs, inputs, ...}:
{

    programs.hyprland = {
        enable = true;
        withUWSM = false;
    };
    environment.systemPackages = with pkgs; [
        kitty 
        waybar
        hyprpaper
        hyprlock
        hypridle
        hyprpicker
        hyprcursor
        grim
        grimblast
        slurp
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
        kdePackages.qtwayland
        kdePackages.qtsvg
        kdePackages.kio-fuse
        kdePackages.kio-extras
        kdePackages.breeze-icons
        kdePackages.qtwebview
    ];
    programs.iio-hyprland.enable = true;
   


}
