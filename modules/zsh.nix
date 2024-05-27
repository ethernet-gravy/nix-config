{ config, lib, pkgs, ...}:
{
   users.defaultUserShell = pkgs.zsh;

   environment.systemPackages = with pkgs; [
        starship
   ];

   programs.starship.enable = true;
   programs = {
       zsh = {
           enable = true;
           autosuggestions.enable = true;
           zsh-autoenv.enable = true;
           syntaxHighlighting.enable = true;
           ohMyZsh = {
               enable = true;
           #    theme = "robbyrussell";
           #    plugins = [
           #        "git"
           #            "history"
           #            "rust"
           #    ];
           };
       };
   };
}
