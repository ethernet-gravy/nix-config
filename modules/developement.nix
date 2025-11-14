{pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        neovim
        lua51Packages.jsregexp
        tree-sitter
        gcc
        clang #probably won't hurt to have both. probably.
        clang-tools
        vscode-langservers-extracted # html-css servers
        valgrind
        neovide
        cmake
        obsidian
        emacs-pgtk
        libvterm
        libtool #stuff for emac
        man-pages
        man-pages-posix
        mermaid-cli #for UML Diagrams
    ];
    documentation.dev.enable = true; #man pages for all my libraries.
    environment.sessionVariables = {
        DOOMDIR = "~/.config/doom/";
    };

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    services.emacs = {
        enable = true;
        defaultEditor = true;
    };
}
