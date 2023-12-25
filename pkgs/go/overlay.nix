final: prev:

let
  callPackage = final.callPackage;
  buildGo120Module = final.buildGo120Module;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in

rec {
  fluxcd = pickLatest (callPackage ./fluxcd { }) prev.fluxcd;

  k3s_1_28 = pickLatest (callPackage ./k3s { buildGoModule = buildGo120Module; }).k3s_1_28 (prev.k3s_1_28 or null);
  k3s = pickLatest k3s_1_28 prev.k3s;

  kubevela = pickLatest (callPackage ./kubevela { }) (prev.kubevela or null);

  vcluster = pickLatest ((import ./vcluster) final prev) prev.vcluster;
}
