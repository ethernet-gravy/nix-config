{pkgs, inputs, ... }:
{
    nixpkgs.overlays = [
        inputs.lem.overlays.default
    ];
    environment.systemPackages = with pkgs; [
        lua51Packages.jsregexp
        tree-sitter
        gcc
        clang #probably won't hurt to have both. probably.
        clang-tools
        #cmake
        vscode-langservers-extracted # html-css servers
        valgrind
        neovide
        obsidian
        emacs-pgtk
        lem-sdl2
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

programs.neovim = {
    enable = true;
    defaultEditor = true;
};
    
    services.emacs = {
        enable = false;
        defaultEditor = false;
    };
}
