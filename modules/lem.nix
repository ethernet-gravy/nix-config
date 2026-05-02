{pkgs, inputs, ... }:
{
    nixpkgs.overlays = [
        inputs.lem.overlays.default
    ];

    environment.systemPackages = with pkgs; [
        lem-webview
    ];

  
} 

