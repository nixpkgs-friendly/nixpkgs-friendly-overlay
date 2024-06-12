final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  firefox-extensions = callPackage ./firefox-extensions { };

  stream-controller = callPackage ./stream-controller { };

  vimPlugins = import ./vim-plugins/default.nix final prev;
}
