# dotfiles

## Technologies

- [Nix]() as package manager.
- [Home Manager]() to take care of my home directory on [NixOS]() and non-NixOS.
- [VSCodium](https://vscodium.com/) and [Neovim](https://neovim.io/).

<br>

## Importante!
- Use o `configuration.nix` para o primeiro build, logo em seguida tudo que irá precisar alterar, vá no `flakeconfig`.
- Altere `initialPassword` nas `configuration.nix`, pois por padrão é `premium`.
- Altere a `hardware-configuration.nix` do `flakeconfig` para igual a sua.
- Para adicionar algo via home-manager, edite no `flakeconfig`e rode `home-manager switch --flake .` dentro da pasta.

<br>

## Repository structure
- `Hosts`: Settings to upload the system
   
- `Templates`: [Nix Flake]() templates that I use to start new projects or package existing ones. 
    - use `nix flake init -t github:lucascipriano/dotfilesnixos#templates.go `and `nix develop`.
- `Flake config`: Config and install Flakes [README pls](https://github.com/Misterio77/nix-starter-config)
    - After reload `nixos-rebuild switch --flake `

---
<br>

## Credits

-   [Ratsclub](https://github.com/ratsclub/dotfiles) Default config Nix/NixOS
-   [Misterio77](https://github.com/Misterio77/nix-starter-config) Start config NixOS + Home Manager + flakes