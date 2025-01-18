
# All overlays given by flakes
flake-overlays:

{ config, pkgs, options, lib, ... }:
{
  nixpkgs.overlays = [
    (
      final: prev: {
        # Your own overlays...
      }
    )
  ] ++ flake-overlays;
  environment.systemPackages = with pkgs; [
    # Other packages
    matlab
    # More packages
  ];
}
