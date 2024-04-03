final: prev:

let
  callPackage = prev.callPackage;
in
prev.vimPlugins
// {
  vim-pairtools = callPackage ./vim-pairtools.nix { };
  vim-taste = callPackage ./vim-taste.nix { };
}
