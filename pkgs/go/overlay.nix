final: prev:

let
  callPackage = final.callPackage;
  buildGo120Module = final.buildGo120Module;
in

rec {
  inherit (callPackage ./k3s {
    buildGoModule = buildGo120Module;
  }) k3s_1_28;
  k3s = k3s_1_28;

}
