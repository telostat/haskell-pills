# Haskell Scripts for Reference

This repository contains Haskell (Nix + Cabal) scripts for reference and quick
demonstration purposes.

Nix is required. Ideally, only Nix is required.

## Example

```sh
./pill-create-zip-archive.hs /tmp/hello.zip
```
## Troubleshooting

### cabal: Could not resolve dependencies

As it states in the warning message: `The package list for 'hackage.haskell.org' does not exist. Run 'cabal update' to download it.`

```sh
nix-shell -p "haskellPackages.cabal-install"
cabal update
```
