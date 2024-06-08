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
        #mako # notifications
        dunst
        qbittorrent
        keepassxc
        armcord
        (pkgs.discord.override {
            # remove any overrides that you don't want
            withOpenASAR = true;
            withVencord = true;
            })
        rustdesk
        wl-clipboard
        jq
        wgnord
        nicotine-plus
    ];
}
