{pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        neovim
        lua51Packages.jsregexp
        tree-sitter
        gcc
        clang #probably won't hurt to have both. probably.
        neovide
        nodejs
        python3
        cmake
        ccls
        obsidian
        emacs30-pgtk
        man-pages
        man-pages-posix
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
