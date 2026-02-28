{pkgs, pkgs-stable, inputs, config, ...}:
#let 
#  stable = import inputs.nixpkgs-stable { config = config.nixpkgs.config // { allowUnfree = true; }; };
#in 
{
     boot.plymouth.enable = true;
    environment.localBinInPath = true;
    environment.systemPackages = with pkgs; [
        wget
        git
        mesa-demos
        vulkan-tools
        gnumake
        fzf
        gh
        stow
        udiskie
        zip
        unzip
        ncmpcpp
        strawberry
        ripgrep
        cava
        kdePackages.dolphin
        imv
        mpv
        qbittorrent
        keepassxc
        vesktop
        telegram-desktop
        jq
        wgnord
        nicotine-plus
        btop
        piper
        yt-dlp
        libratbag
        openconnect
        inputs.openconnect-pulse-launcher.packages."${pkgs.system}".openconnect-pulse-launcher
        chezmoi
        ouch #obvious unified compression helper
        orca-slicer
        simple-mtpfs
        ffmpeg
        ]; 

    programs.yazi.enable = true;

    programs.obs-studio = {
        enable = true;
        plugins = with pkgs; [ obs-studio-plugins.obs-vaapi];
    };

    nixpkgs.config.packageOverrides = pkgs: {
        yazi = pkgs.yazi.override  {
            _7zz = pkgs._7zz-rar; 
            };
    };

    programs.coolercontrol.enable = true;
    hardware.keyboard.qmk.enable = true;
}

