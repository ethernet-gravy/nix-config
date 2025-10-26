{ config, lib, pkgs, ... }:

{
#   services.udev.extraRules = ''
# ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="c502", ATTR{idProduct}=="0023", RUN+="${pkgs.writeShellScriptBin "sync_music_player" ''
# echo "running the file" > /home/nakul/mp3-output.log
# (set -m; .${pkgs.writeShellScriptBin "do_sync_music_player" (builtins.readFile ./sync-music-player.sh)}/bin/do_sync_music_player)
# '' }/bin/sync_music_player"
# '';

  
  systemd.user.services.poor-mans-itunes = {
    enable = true;
    requires = ["run-media-nakul-EROS\\x20Q.mount"];
    after = ["run-media-nakul-EROS\\x20Q.mount"];
    description = "fuck you steve jobs";

    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.writeShellScriptBin "sync_music_player" ''
usb_folder="/run/media/nakul/EROS Q/"
music_folder="/home/nakul/Music/"


# exit if the usb and music folders don't exist
[ -d "$usb_folder" ] || exit 0
[ -d "$music_folder" ] || exit 0

${pkgs.rsync}/bin/rsync -av --no-owner --no-group --ignore-existing --size-only --delete-after --exclude ".stfolder/" --exclude ".rockbox/" "$music_folder" "$usb_folder"

''}/bin/sync_music_player'';
    };
    
    wantedBy = ["run-media-nakul-EROS\\x20Q.mount"];
  };
  
}
