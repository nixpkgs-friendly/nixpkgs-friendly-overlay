final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
rec {
  # dagger = callPackage ./dagger { };

  # fluxcd = pickLatest (callPackage ./fluxcd { }) prev.fluxcd;
}
