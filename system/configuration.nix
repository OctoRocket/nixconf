# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "octonix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
    videoDrivers = [ "nvidia" ];
  };

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  nix = {
    package = pkgs.nixFlakes;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/45f70305-d54a-4e99-b09b-5b32d9f5cb58"; } ];

  hardware.opengl.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.octorocket = {
    isNormalUser = true;
    description = "OctoRocket";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      firefox
      thunderbird
      kitty
      fira-code
      vscode
      (discord.override { nss = nss_latest; })
      papirus-icon-theme
      gnome.gnome-tweaks
      breeze-gtk
      git
      git-crypt
      gnupg
      gh
      python311
      prismlauncher
      freshfetch
      lolcat
      fortune
      protontricks
      virt-manager
      obs-studio
      ffmpeg
      the-powder-toy
      rustup
      gcc
      gparted
      unzip
      tmux
      appimage-run
      rust-analyzer
      lunar-client
      grapejuice
      gnome.gnome-mines
      wine
    ];
  };

  programs.steam.enable = true;

  nixpkgs.config.allowUnfree = true;

  home-manager.users.octorocket = { pkgs, ... }: {
    programs.home-manager.enable = true;
    home.stateVersion = "22.05";
    programs.bash.enable = true;
    xdg.enable = true;
    xdg.configFile."discord/settings.json".text = builtins.toJSON {SKIP_HOST_UPDATE = true;};
    xdg.configFile."../.themes/Catppuccin-Mocha-Lavender".source = "${../configs/Catppuccin-Mocha-Lavender}";
    xdg.configFile."kitty/kitty.conf".source = "${../configs/kitty.conf}";
    xdg.configFile."fish/config.fish".source = "${../configs/config.fish}";

    xdg.configFile."nvim/init.vim".source = "${../configs/nvim/init.vim}";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
