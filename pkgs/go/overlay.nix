final: prev:

let
  fetchpatch2 = prev.fetchpatch2;
  callPackage = final.callPackage;
in
rec {
  fluxcd = callPackage ./fluxcd { };

  k3s_1_26 = callPackage ./k3s/1_26 { };
  k3s_1_27 = callPackage ./k3s/1_27 { };
  k3s = k3s_1_27;
}
