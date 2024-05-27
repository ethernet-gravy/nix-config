{pkgs, ...}:
{
     
    environment.localBinInPath = true;
    environment.systemPackages = with pkgs; [
        wget
        git
        gnumake
        fzf
        gh
        stow
        udiskie
        rofi-wayland
        zip
        unzip
        mpd
        ncmpcpp
        grim
        slurp
        swappy
        cava
        yazi
        dolphin
        imv
        mako # notifications
        qbittorrent
        keepassxc
        armcord
    ];
}
