{config, ...}:
{
# services.greetd = {
#    enable = true;
#    settings = {
#        initial_session = {
#            command = "${pkgs.hyprland}/bin/Hyprland";
#            user = "nakul";
#        };
#      default_session = {
#        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${config.services.xserver.displayManager.sessionData.desktops}/share/xsessions:${config.services.xserver.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
#        user = "greeter";
#      };
#    };
#  };
#systemd.services.greetd = {
# The following option is aimed at removing the error flood to the tui dm
#    serviceConfig = {
#        Type = "idle";
#        StandardInput = "tty";
#        StandardOutput = "tty";
#        StandardError = "journal";
#        TTYReset = true;
#        TTYVHangup = true;
#        TTYVTDislocate = true;
#    };
#};

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
#       settings = {
#           Autologin = {
#                Session = "Hyprland.desktop";
#                User = "nakul";
#           };
#       };
    };
    services.xserver.displayManager.startx.enable = true;
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "nakul";
    services.displayManager.defaultSession = "hyprland";
}
