final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  firefox-extensions = callPackage ./firefox-extensions { };

  vimPlugins = import ./vim-plugins/default.nix final prev;
}
