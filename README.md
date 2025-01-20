# ❄ Nix Stuff ❄

Some "nix stuff" repository:

- Disko
- NixOS
- Home-manager
- Stylix
- AGS

# Desktop version installation

### With bootable USB flash drive

- Update `./settings.nix`
- Boot with NixOS USB drive
- Make disk partitioning with [disko](https://github.com/nix-community/disko?ysclid=m37md4ni64813417409):

```bash
sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko/latest -- \
  --mode disko ./profiles/desktop/disk-config.nix

```

- Update `hardware-configuration.nix`:

```bash
sudo nixos-generate-config --show-hardware-config > ./profiles/desktop/hardware-configuration.nix
```

> Disko already defines filesystems, so you need to remove redundant defines

- Install NixOS itself:

```bash
sudo nixos-install --flake .#nixos
```

### With [nixos-anywhere](https://github.com/nix-community/nixos-anywhere?ysclid=m37mp47i7c377992155)

- Update `./settings.nix`
- Run nixos-anywhere to install system via ssh:

```bash
nix run github:nix-community/nixos-anywhere -- \
  --generate-hardware-config nixos-generate-config ./profiles/desktop/hardware-configuration.nix --flake .#nixos root@<ip address>
```

> Default password for root connection is `ASDzxc123`, do not forget to update pass with passwd.

# Remote version installation

You only need to install home-manager.
Moreover, remote installation settings are set up by default.

```bash
git clone https://github.com/Ruhrozz/nix.git ~/.dotfiles
nix --extra-experimental-features "nix-command flakes" run github:nix-community/home-manager -- \
  switch -b backup --flake ~/.dotfiles --extra-experimental-features 'nix-command flakes'
```

# Appreciation

Special thanks to Nikita Zheleztsov (Serpentian) and his [AlfheimOS](https://github.com/Serpentian/AlfheimOS) for being a starting-point of this repository.
It was so hard to find a good NixOS configuration with custom SOTA status bar such as [ags](https://github.com/adventuregamestudio/ags) and Hyprland window manager.
