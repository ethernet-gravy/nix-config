# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader = {
	systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;
  };

   networking.hostName = "nixos"; # Define your hostname.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "America/Winnipeg";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  virtualisation.virtualbox.guest.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers =[ "modesetting" ];
  services.xserver.resolutions = [
  	{
	x = 1920;
	y = 1080;
	}
  ];

  programs.hyprland.enable = true;
   services.xserver.displayManager.sddm = {
       enable = true;
       wayland.enable = true;
#       settings = {
#           Autologin = {
#                Session = "Hyprland.desktop";
#                User = "nakul";
#           };
#       };
   };
   services.xserver.displayManager.startx.enable = true;
   services.xserver.displayManager.autoLogin.enable = true;
   services.xserver.displayManager.autoLogin.user = "nakul";
   services.xserver.windowManager.awesome = {
   	enable = true;
	luaModules = with pkgs.luaPackages; [
		luarocks
		luadbi-mysql
	];
   };

# services.greetd = {
#    enable = true;
#    settings = {
#        initial_session = {
#            command = "${pkgs.hyprland}/bin/Hyprland";
#            user = "nakul";
#        };
#      default_session = {
#        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${config.services.xserver.displayManager.sessionData.desktops}/share/xsessions:${config.services.xserver.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
#        user = "greeter";
#      };
#    };
#  };

systemd.services.greetd = {
# The following option is aimed at removing the error flood to the tui dm
    serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal";
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDislocate = true;
    };
};
   services.xserver.windowManager.dwm.enable = true;
   services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
	src = /home/nakul/.dots/dwm/.config/dwm;
   };


  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.nakul = {
     isNormalUser = true;
     extraGroups = [ "NetworkManager" "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
     firefox
  #     firefox
  #     tree
     ];
 };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     networkmanagerapplet
     neovim
     lua51Packages.jsregexp #nvim dependency
     tree-sitter #nvim dependency
     nodejs_21 #nvim dependency
     neovide #nvim gui
     gcc
     git
     fish
     wezterm
     gnumake
     starship
     fzf
     dwmblocks
     gh
     kitty
     stow
     waybar
     pywal
     udiskie
     swaybg
     rofi-wayland
     zip
     unzip
     mpd
     ncmpcpp
     hyprpaper
     grim
     slurp
     swappy
#     obsidian
     cava
     qbittorrent
     armcord
     keepassxc
     yazi
     dolphin
     wl-clipboard
     imv
   ];

   environment.sessionVariables = {
   	EDITOR = "nvim";
   };
   environment.localBinInPath = true;
   users.defaultUserShell = pkgs.zsh;

   programs.starship.enable = true;
   programs = {
       zsh = {
           enable = true;
           autosuggestions.enable = true;
           zsh-autoenv.enable = true;
           syntaxHighlighting.enable = true;
           ohMyZsh = {
               enable = true;
           #    theme = "robbyrussell";
           #    plugins = [
           #        "git"
           #            "history"
           #            "rust"
           #    ];
           };
       };
   };

  fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = ["CascadiaCode" "Iosevka" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    neovim.defaultEditor = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
#   system.copySystemConfiguration = true;

   nixpkgs.config.allowUnfree =  true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

