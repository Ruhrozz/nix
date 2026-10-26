# ❄ Nix Stuff ❄

Some "nix stuff" repository:

- NixOS
- Home-manager
- Stylix

# Desktop version installation

### With bootable USB flash drive

- Update `./settings.nix`
- Boot with NixOS USB drive
- Partition the disk manually and mount the target filesystems under `/mnt`.

- Update `hardware-configuration.nix`:

```bash
sudo nixos-generate-config --show-hardware-config > ./profiles/desktop/hardware-configuration.nix
```

Keep the generated filesystem definitions in `hardware-configuration.nix`.

- Install NixOS itself:

```bash
sudo nixos-install --flake .#nixos
```

# Remote version installation

You only need to install home-manager.
Moreover, remote installation settings are set up by default.

```bash
git clone https://github.com/Ruhrozz/nix.git ~/.dotfiles
nix --extra-experimental-features "nix-command flakes" run github:nix-community/home-manager -- \
  switch -b nixhmbak --flake ~/.dotfiles --extra-experimental-features 'nix-command flakes'
```
