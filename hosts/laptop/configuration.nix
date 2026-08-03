# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  pkgs,
  inputs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  # Use the limine EFI boot loader.
  boot.loader.limine.enable = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "laptop"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "pl_PL.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty. };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "pl";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.foo = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.nushell;
    packages = [
      pkgs.tree
    ];
  };

  # flatpak
  services.flatpak.enable = true;

  # steam
  programs.steam.enable = true;

  # spicetify for spotify
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
    ];
  };

  # localsend
  programs.localsend.enable = true;

  # git
  programs.git = {
    enable = true;
    config.user = {
      email = "104304061+devc3tt@users.noreply.github.com";
      name = "devc3tt";
    };
  };

  # cachix
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };

  # nh
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 3";
    flake = "/home/foo/nix";
  };

  # cade: better direnv
  # the hook is in config.nu until I find a better solution
  programs.cade = {
    enable = true;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # Basic tools
    wget
    wl-clipboard

    # Text editors
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    helix

    # themes
    kdePackages.breeze

    # File managers
    kdePackages.dolphin
    yazi

    # Important tools
    tofi
    fuzzel
    ripgrep
    fd
    btop
    libnotify
    tmux # a good terminal multiplexer

    # Encryption
    gnupg
    age

    microfetch # speedy flex on ubuntu users

    # Browsers
    firefox

    # Terminal
    foot

    # looks
    starship
    nwg-look
    awww

    # wm tools
    quickshell
    mako

    # Screenshots
    grim
    slurp

    # Chats
    equibop

    # Gaming
    protonplus
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin

    # lsp, for when I quickly want to edit nix
    nixd
    nixfmt

    # Other
    qbittorrent

    # office
    libreoffice-qt
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    material-symbols
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    iosevka
  ];

  # environment variables
  environment.sessionVariables = {
    # xdg
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";
    # stuff so I don't have to put random config files in ~
    HISTFILE = "$XDG_STATE_HOME/bash/history";
    CARGO_HOME = "$XDG_DATA_HOME/cargo";
    XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose";
    GTK2_RC_FILES = "$XDG_CONFIG_HOME/gtk-2.0/gtkrc";
    WINEPREFIX = "$XDG_DATA_HOME/wine";
  };

  fonts.fontconfig.useEmbeddedBitmaps = true; # for emojis in firefox (so librewolf)

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable greetd (display manager)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "foo";
        command = "${pkgs.greetd}/bin/agreety --cmd start-hyprland";
      };
    };
  };

  # Window managers and desktop environments

  # Enable sway
  programs.sway = {
    enable = true;
  };

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable ssh-agent
  programs.ssh.startAgent = true;

  # Enable udisks2 for automounts in dolphin
  services.udisks2.enable = true;

  # Enable upower (battery)
  services.upower.enable = true;

  # Enable tlp (optimizing battery)
  services.tlp.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
