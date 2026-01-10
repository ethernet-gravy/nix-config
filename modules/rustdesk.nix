
{pkgs, pkgs-stable, config,  ...}:
{
    environment.systemPackages = with pkgs-stable; [
        rustdesk
    ];
}
