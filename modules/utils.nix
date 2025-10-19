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
        walker        
        zip
        unzip
        ncmpcpp
        strawberry
        grim
        grimblast
        slurp
        ripgrep
        satty
        cava
        kdePackages.dolphin
        imv
        mpv
        #mako # notifications
        #dunst
        qbittorrent
        keepassxc
        vesktop
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
        openconnect
        inputs.openconnect-pulse-launcher.packages."${pkgs.system}".openconnect-pulse-launcher
        freecad
        chezmoi
        styluslabs-write
        xournalpp # write but better, gonna keep both, see which one i like more.
        texlab
        ouch #obvious unified compression helper
        libnotify
        orca-slicer
        simple-mtpfs
        (pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-medium
          dvisvgm dvipng # for preview and export as html
          wrapfig amsmath ulem hyperref capt-of
          latexmk titlesec listings caption float subfig
          etoolbox xcolor enumitem collection-fontsrecommended
          mylatexformat cancel;
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

    programs.yazi.enable = true;

    nixpkgs.config.packageOverrides = pkgs: {
        yazi = pkgs.yazi.override  {
            _7zz = pkgs._7zz-rar; 
            };
    };

}

