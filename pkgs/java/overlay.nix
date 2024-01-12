final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in

rec {
  java-service-wrapper = callPackage ./java-service-wrapper { };
}


### Notes
# fluxcd = pickLatest (callPackage ./fluxcd { }) prev.fluxcd;
# k3s_1_28 = pickLatest (callPackage ./k3s { buildGoModule = buildGo120Module; }).k3s_1_28 (prev.k3s_1_28 or null);
