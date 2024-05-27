{pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        neovim
        lua51Packages.jsregexp
        tree-sitter
        gcc
        neovide
        nodejs
        rustup
        obsidian
    ];
    environment.sessionVariables = {
        EDITOR = "nvim";
    };
    programs = {
        neovim.defaultEditor = true;
    };
}
