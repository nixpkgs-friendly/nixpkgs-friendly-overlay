final: prev:

let
  callPackage = prev.callPackage;
in
prev.vimPlugins
// {
  vim-log-highlighting = callPackage ./vim-log-highlighting.nix { };
  vim-pairtools = callPackage ./vim-pairtools.nix { };
  vim-taste = callPackage ./vim-taste.nix { };
}
