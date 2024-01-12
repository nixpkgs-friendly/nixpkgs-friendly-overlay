final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in

rec {
  java-service-wrapper = callPackage ./java-service-wrapper { };

  i2p = callPackage ./i2p { };
}

