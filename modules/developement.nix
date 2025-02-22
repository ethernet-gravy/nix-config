{pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        neovim
        lua51Packages.jsregexp
        tree-sitter
        gcc
        neovide
        nodejs
        obsidian
        emacs29-pgtk
    ];
    environment.sessionVariables = {
        EDITOR = "nvim";
    };
    programs = {
        neovim.defaultEditor = true;
    };

    services.emacs.enable = true;
}
