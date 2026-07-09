# johnos

Personal NixOS + home-manager configuration, managed as a single flake.

## Layout

- `flake.nix` — inputs and a `mkHost` helper that assembles a `nixosConfigurations` entry
  per machine.
- `hosts/<name>/` — per-host entry point (`configuration.nix`) and generated
  `hardware-configuration.nix`.
- `modules/` — shared NixOS system modules (boot, networking, desktop, hardware,
  programs, services).
- `home/` — home-manager modules, one per program, imported by `home.nix`.

Adding a new machine: create `hosts/<name>/{configuration.nix,hardware-configuration.nix}`,
then add `nixosConfigurations.<name> = mkHost { hostname = "<name>"; };` in `flake.nix`.

## Usage

```sh
# Apply the config to the running machine
sudo nixos-rebuild switch --flake .#nixos

# Build without switching, to sanity-check a change
nixos-rebuild build --flake .#nixos

# Format all Nix files
nix fmt

# Evaluate + build everything the flake exposes (what CI runs)
nix flake check --all-systems

# Enter a shell with formatter/linters/nix LSP available
nix develop
```

## CI

- `check.yml` runs `nix flake check` on every push/PR — this evaluates and builds the
  system, so a broken change or dependency bump fails here instead of on the real machine.
- `update-flake.yml` bumps `flake.lock` daily and opens a PR (rather than pushing straight
  to `main`), so `check.yml` verifies the bump before it merges.
