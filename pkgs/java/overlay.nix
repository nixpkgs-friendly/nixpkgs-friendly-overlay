final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in

rec {

  i2p = callPackage ./i2p { };
}

