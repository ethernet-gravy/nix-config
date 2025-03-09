{pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        neovim
        lua51Packages.jsregexp
        tree-sitter
        gcc
        neovide
        #nodejs
        python3
        cmake
        obsidian
        emacs30-pgtk
    ];
    environment.sessionVariables = {
        EDITOR = "nvim";
        DOOMDIR = "~/.config/doom/";
    };
    programs = {
        neovim.defaultEditor = true;
    };

    services.emacs.enable = true;
}
