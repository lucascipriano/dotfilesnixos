{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  programs.home-manager.enable = true;

 
  home.packages = [
    pkgs.htop
    pkgs.tdesktop
    pkgs.pcmanfm
    pkgs.vscodium
  ];

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



}
