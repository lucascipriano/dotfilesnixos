# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    # inputs.nix-colors.homeManagerModule

    # Feel free to split up your configuration and import pieces of it here.
  ];

  # Comment out if you wish to disable unfree packages for your system
  nixpkgs.config.allowUnfree = true;

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; 
  [ htop ]
  ++ [ keepassxc];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;


    programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ 
      vim-airline
      vim-nix
      nerdtree 
      onehalf
    ];
    settings = { ignorecase = true; };
    extraConfig = ''
      syntax on
      set hidden
      set number
      set relativenumber
      set title
      set cursorline
      set encoding=utf-8
      set expandtab
      set shiftwidth=2
      set mouse=a
      colorscheme onehalfdark
      let g:airline_theme='onehalfdark'
    '';
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
