final: prev:

let
  callPackage = final.callPackage;
  buildGo120Module = final.buildGo120Module;
  buildGo121Module = final.buildGo121Module;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in

rec {
  dagger = callPackage ./dagger { };

  #etcd = callPackage ./etcd { };

  # fluxcd = pickLatest (callPackage ./fluxcd { }) prev.fluxcd;

  k3s_1_28 = pickLatest (callPackage ./k3s { buildGoModule = buildGo120Module; }).k3s_1_28 (prev.k3s_1_28 or null);
  k3s_1_29 = pickLatest (callPackage ./k3s { buildGoModule = buildGo121Module; }).k3s_1_29 (prev.k3s_1_29 or null);
  k3s = pickLatest k3s_1_29 prev.k3s;

  # vcluster = pickLatest ((import ./vcluster) final prev) prev.vcluster;
}
