{
  description = "Nix Config";

  inputs = {

  nix-matlab = {
    # nix-matlab's Nixpkgs input follows Nixpkgs' nixos-unstable branch. However
    # your Nixpkgs revision might not follow the same branch. You'd want to
    # match your Nixpkgs and nix-matlab to ensure fontconfig related
    # compatibility.
    inputs.nixpkgs.follows = "nixpkgs";
    url = "gitlab:doronbehar/nix-matlab";
  };
    # Nixpkgs
#    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
#    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    rust-overlay = {
        url = "github:oxalica/rust-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    #stylix.url = "github:danth/stylix";
    rose-pine-hyprcursor = {
        url = "github:ndom91/rose-pine-hyprcursor";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home manager
    home-manager = {
        url = "github:nix-community/home-manager/release-24.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    #home-manager,
    #stylix,
    rust-overlay,
    nix-matlab,
    ...
  } @ inputs: let
    inherit (self) outputs;
    flake_overlays = [
        nix-matlab.overlay
    ];
    #system = "x86_64-linux";
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
            inherit inputs outputs;
            #inherit pkgs-stable;

        };
        # > Our main nixos configuration file <
        # modules = [./nixos/configuration.nix];
         modules = [
            ./laptop/configuration.nix
            ./modules/audio.nix
            ./modules/bootloader.nix
            ./modules/developement.nix
            ./modules/display_manager.nix
            ./modules/fonts.nix
            ./modules/users.nix
            ./modules/utils.nix
            ./modules/sync.nix
            ./modules/hyprland.nix
            ./modules/services.nix
            ./modules/zsh.nix
            ./modules/network.nix
            ./modules/rust.nix
            ./modules/bluetooth.nix
            ./modules/corectrl.nix
            (import ./modules/matlab.nix flake_overlays)
         ];
      };
      server = nixpkgs.lib.nixosSystem {
          specialArgs = {
              inherit inputs outputs;
          };
          modules = [
          ./server/configuration.nix
#          ./modules/zsh.nix
          ./modules/developement.nix
          ./modules/sync.nix
          ];
      };
      pc = nixpkgs.lib.nixosSystem {
        specialArgs = {
            inherit inputs outputs;
            #inherit pkgs-stable;
        };
        # > Our main nixos configuration file <
        # modules = [./nixos/configuration.nix];
         modules = [
            ./pc/configuration.nix
            ./modules/corectrl.nix
            ./modules/audio.nix
            ./modules/rear-audio-jack-fix.nix
            ./modules/bootloader.nix
            ./modules/developement.nix
            ./modules/display_manager.nix
            ./modules/fonts.nix
            ./modules/gaming.nix
            ./modules/users.nix
            ./modules/utils.nix
            ./modules/hyprland.nix
            ./modules/services.nix
            ./modules/sync.nix
            ./modules/x11.nix
            ./modules/zsh.nix
            ./modules/network.nix
            ./modules/rust.nix
            ./modules/amd.nix
            ./modules/kicad.nix
            (import ./modules/matlab.nix flake_overlays)
            #./modules/kvm.nix
         ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
#    homeConfigurations = {
#      # FIXME replace with your username@hostname
#      "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
#        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
#        extraSpecialArgs = {inherit inputs outputs;};
#        # > Our main home-manager configuration file <
#        modules = [./home-manager/home.nix];
#      };
#    };
  };
}
