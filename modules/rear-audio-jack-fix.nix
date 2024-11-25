{pkgs, ...}:
{
    systemd.user.services.custom-enable-speakers = {
        enable = true;
        after = ["pipewire-pulse.service" "pipewire-media-session.service"];
        description = "...";
        serviceConfig = {
            Type = "simple";
        };
        script = ''
            ${pkgs.alsa-utils}/bin/amixer sset "Line" unmute -c 2
            ${pkgs.alsa-utils}/bin/amixer sset "Line" 100% -c 2
            ${pkgs.alsa-utils}/bin/amixer sset "Auto-Mute Mode" Disabled -c 2
            '';
        wantedBy = [ "default.target" ]; # starts after login
    };

  
}
