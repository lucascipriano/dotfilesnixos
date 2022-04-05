{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sda";
      };
    };
  };

  networking = {
    useDHCP = false;
    hostName = "x571";
    extraHosts = "127.0.1.1 x571";
    networkmanager.enable = true;
      interfaces = {
        enp2s0f0.useDHCP = true;
        wlp3s0.useDHCP = true;
      };
  };
    programs = {
    
    light.enable = true;
    nm-applet.enable = true;
  };
  
    nix = {
      package = pkgs.nixFlakes; # or versioned attributes like nix_2_7
      extraOptions = ''
                     '';
      };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };


   console = {
     font = "Lat2-Terminus16";
     keyMap = "br-abnt2";
   };

  time.timeZone = "America/Sao_Paulo";

   environment.systemPackages = with pkgs; 
   
    # base
    [ wget curl vim git alacritty ]

      # Standard programs
    ++ [ flameshot ranger xclip]

      # Communication
      ++ [ ]

      # Browsers
        ++ [ firefox ]

        # Random
          ++ [ ];

  # Programas nofree
  nixpkgs.config.allowUnfree = true;

  #SSH
  services.openssh.enable = true;
  
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "br";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.windowManager.i3.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;

    services.xserver.windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
     ];
    };

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.lucas = {
     isNormalUser = true;
    createHome = true;
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    initialPassword = "premium";
   };
   
  system.stateVersion = "21.11";

}

