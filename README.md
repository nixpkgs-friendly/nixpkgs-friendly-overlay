# nixpkgs-friendly-overlay

This repository accumulates improvements in "overlay format" that could/should eventually be merged upstream.

Code drift is bad. Upstreaming code is encouraged.

For non-overlay contributions, contribute to:
https://github.com/nixpkgs-friendly/nixpkgs-friendly

# Formatting

Use `nixfmt` as formatter.

# Adding packages

...

To test a package that you're adding you can use `nix build .#pkgsDebug.<your_package_here>`
