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
        cmake
        vscode-langservers-extracted # html-css servers
        valgrind
        neovide
        obsidian
        emacs-pgtk
        lem-webview
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


# added udev rules to allow programming the rp2040 for now.
services.udev.extraRules = ''
SUBSYSTEM=="usb", \
    ATTRS{idVendor}=="2e8a", \
    ATTRS{idProduct}=="0003", \
    TAG+="uaccess", \
    MODE="660", \
    GROUP="plugdev"
SUBSYSTEM=="usb", \
    ATTRS{idVendor}=="2e8a", \
    ATTRS{idProduct}=="0009", \
    TAG+="uaccess", \
    MODE="660", \
    GROUP="plugdev"
SUBSYSTEM=="usb", \
    ATTRS{idVendor}=="2e8a", \
    ATTRS{idProduct}=="000a", \
    TAG+="uaccess", \
    MODE="660", \
    GROUP="plugdev"
SUBSYSTEM=="usb", \
    ATTRS{idVendor}=="2e8a", \
    ATTRS{idProduct}=="000f", \
    TAG+="uaccess", \
    MODE="660", \
    GROUP="plugdev"
'';
    
    services.emacs = {
        enable = false;
        defaultEditor = false;
    };
}
