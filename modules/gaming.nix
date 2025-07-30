{pkgs, ...}:
{
    environment.systemPackages = (with pkgs; [
        wineWowPackages.stable
        winetricks
        lutris
        protontricks
        heroic
        gamescope
        mangohud
        lm_sensors
        pcsx2
        rpcs3
        ns-usbloader
        xorg.xhost
    ]);

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
    
  };
    programs.steam.enable = true;
    programs.steam.extraCompatPackages = [pkgs.proton-ge-bin];
    programs.gamemode.enable = true;
    nixpkgs.config.packageOverrides = pkgs: {
        steam = pkgs.steam.override {
            extraPkgs = pkgs: with pkgs; [
                xorg.libXcursor
                    xorg.libXi
                    xorg.libXinerama
                    xorg.libXScrnSaver
                    libpng
                    libpulseaudio
                    libvorbis
                    stdenv.cc.cc.lib
                    libkrb5
                    keyutils
            ];
        };
    };
}
