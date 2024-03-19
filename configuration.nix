# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "yukibana"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  # environment vars
  nixpkgs.config.qt5 = {
    enable = true;
    platformTheme = "qt5ct"; 
      style = {
        package = pkgs.utterly-nord-plasma;
        name = "Utterly Nord Plasma";
      };
  };
  environment.variables.QT_QPA_PLATFORMTHEME="qt5ct";
  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  #i18n.inputMethod.enabled = "fcitx5";
  #i18n.inputMethod.fcitx5.addons = [
  #  pkgs.fcitx5-mozc
  #  pkgs.fcitx5-gtk
  #  pkgs.fcitx5-configtool
  #];
  # environment.variables.GLFW_IM_MODULE = "ibus";
  i18n.inputMethod.enabled = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [mozc];
  
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
   };
  
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    windowManager.i3.enable = true;
    desktopManager.runXdgAutostartIfNone = true;
    layout = "us";
    videoDrivers = [ "amdgpu" ];
    #libinput.enable = true;
    #libinput.touchpad.naturalScrolling = true;
  };

  #services.picom = {
  #  enable = true;
  #  vSync = true;
  #};

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
  security.rtkit.enable = true;
  sound.mediaKeys = {
    enable = true;
    volumeStep = "5%";
  };
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gpierson = {
    isNormalUser = true;
    description = "Galileo";
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" "tty"];
    packages = with pkgs; [
      firefox
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; 
let
      polybar = pkgs.polybar.override {
        i3Support = true;
      };
    in
  [
    polybar
    vscode
    ghidra
    wireshark
    filezilla
    mitmproxy
    python311Packages.mitmproxy-wireguard
    godot_4
    android-tools
    android-studio
    scrcpy
    gdb
    ranger
    lf
    wget
    neovim
    gcc
    gnumake
    desktop-file-utils
    ripgrep
    lazygit
    bottom
    polkit
    polkit-kde-agent
    gsimplecal
    i3
    kitty
    kitty-themes
    kitty-img
    zsh
    gnome.gdm
    dunst
    bind
    p7zip
    ark
    mpvScripts.mpris
    mpv
    playerctl
    alsa-utils
    pamixer
    xbindkeys
    xorg.xev
    sxiv
    feh
    xclip
    flameshot
    scrot
    maim
    yt-dlp
    imagemagick
    zathura
    cron
    obsidian
    neofetch
    redshift
    curl
    wget
    libreoffice-still
    arandr
    xorg.xrandr
    conda
    git
    sshfs
    openssh
    rsync
    dolphin
    qt5ct
    python3
    python311Packages.pip
    networkmanagerapplet
    wireguard-tools
    polkit_gnome
    i3
    picom
    rofi
    usbutils
    subversion
    minicom
    screen
    autorandr
    killall
    lxappearance
    capitaine-cursors
    libsForQt5.qt5ct
    libsForQt5.breeze-icons
    libsForQt5.ark
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    ungoogled-chromium
    lm_sensors
    i3lock-fancy-rapid
    pavucontrol
    cifs-utils
    xlsfonts
    materia-theme
    pciutils
    xorg.xf86videoamdgpu
    xpra
    nvtop-amd
    btop
    htop
    cmatrix
    file
    appimage-run
    polkit
    unetbootin
    gparted
    exfatprogs
    ntfs3g
    gnome.nautilus
    rdesktop
    freerdp
    dbeaver
    libsForQt5.qt5ct
    unzip
  ];

  fonts.packages = with pkgs; [
    siji
    nerdfonts
    font-awesome
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-cjk
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    fira-mono
    fira-code
    carlito
    dejavu_fonts
    ipafont
    kochi-substitute
    source-code-pro
    ttf_bitstream_vera
    xorg.xbacklight
    krita
  ];
  
  # Set default fonts
  fonts.fontconfig.defaultFonts = {
    monospace = [
      "Fira Mono"
      "Noto Sans Mono CJK JP"
    ];

    sansSerif = [
      "Fira Mono"
      "Noto Sans CJK JP"
    ];

    serif = [
      "Fira Mono"
      "Noto Serif CJK JP"
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    "python3.11-django-3.1.14"
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  # DOCKER
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  users.extraGroups.docker.members = [ "gpierson" ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # This is using a rec (recursive) expression to set and access XDG_BIN_HOME within the expression
  # For more on rec expressions see https://nix.dev/tutorials/first-steps/nix-language#recursive-attribute-set-rec
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
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
