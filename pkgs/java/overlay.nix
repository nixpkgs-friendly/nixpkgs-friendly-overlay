final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
rec {
  biglybt = pickLatest (callPackage ./biglybt { }) (prev.biglybt or null);
}
