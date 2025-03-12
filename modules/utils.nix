{pkgs, inputs, config, ...}:
#let 
#  stable = import inputs.nixpkgs-stable { config = config.nixpkgs.config // { allowUnfree = true; }; };
#in 
{
     boot.plymouth.enable = true;
    environment.localBinInPath = true;
    environment.systemPackages = (with pkgs; [
        wget
        git
        libreoffice
        glxinfo
        vulkan-tools
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
        kdePackages.dolphin
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
        zathura
        wl-clipboard
        jq
        wgnord
        nicotine-plus
        brightnessctl
        btop
        qmk
        piper
        libratbag
        ipe
        freecad
        bambu-studio
        styluslabs-write
        texlab
        (pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-medium
          dvisvgm dvipng # for preview and export as html
          wrapfig amsmath ulem hyperref capt-of
          latexmk titlesec listings caption float subfig
          etoolbox xcolor enumitem collection-fontsrecommended
          mylatexformat;
       })
        ffmpeg
        (wrapOBS {
            plugins = with obs-studio-plugins; [
#droidcam currently broken
                #droidcam-obs
                obs-vaapi
            ];
         })
    ]); 
}
