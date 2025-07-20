{ config, lib, pkgs, ...}:
{
   users.defaultUserShell = pkgs.fish;

   environment.systemPackages = with pkgs; [
        starship
   ];

   programs.starship.enable = true;
   programs = {
       fish = {
           enable = true;
           };
       };
   programs.fzf.keybindings = true;
}
