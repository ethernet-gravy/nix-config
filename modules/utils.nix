{pkgs, ...}:
{
     
     boot.plymouth.enable = true;
    environment.localBinInPath = true;
    environment.systemPackages = with pkgs; [
        wget
        git
        libreoffice
        gnumake
        fzf
        gh
        stow
        udiskie
        rofi-wayland
        zip
        unzip
        ncmpcpp
        strawberry
        grim
        grimblast
        slurp
        ripgrep
        swappy
        cava
        yazi
        dolphin
        imv
        mpv
        #mako # notifications
        dunst
        qbittorrent
        keepassxc
        (pkgs.discord.override {
            # remove any overrides that you don't want
            withOpenASAR = false;
            withVencord = true;
            })
        telegram-desktop
        rustdesk
        zathura
        wl-clipboard
        jq
        wgnord
        nicotine-plus
        btop
        qmk
    ];
}
