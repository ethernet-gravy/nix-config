
{config, pkgs, ... }:
{
    programs.corectrl.enable = true; 
    users.users.nakul.extraGroups = ["corectrl"];
}
