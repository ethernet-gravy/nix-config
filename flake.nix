{
  description = "Nix Config";

  inputs = {
    # Nixpkgs
#    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
#    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    stylix.url = "github:danth/stylix";
    # Home manager
    home-manager = {
        url = "github:nix-community/home-manager/release-24.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    rust-overlay,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
            inherit inputs outputs;
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
            ./modules/hyprland.nix
            ./modules/services.nix
            ./modules/zsh.nix
            ./modules/network.nix
            ./modules/rust.nix
         ];
      };
      pc = nixpkgs.lib.nixosSystem {
        specialArgs = {
            inherit inputs outputs;
        };
        # > Our main nixos configuration file <
        # modules = [./nixos/configuration.nix];
         modules = [
            ./pc/configuration.nix
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
            ./modules/x11.nix
            ./modules/zsh.nix
            ./modules/network.nix
            ./modules/rust.nix
            ./modules/amd.nix
#            stylix.nixosModules.stylix
#            ./modules/stylix.nix
#            home-manager.nixosModules.home-manager {
#                home-manager.useGlobalPkgs = true;
#                home-manager.useUserPackages = true;
#                home-manager.users.nakul = import ./pc/home.nix;
#                home-manager.extraSpecialArgs = {inherit inputs;};
#            }
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
