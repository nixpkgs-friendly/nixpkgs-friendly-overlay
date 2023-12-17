final: prev:

let
  callPackage = final.callPackage;
  buildGo120Module = final.buildGo120Module;
in

rec {
  fluxcd = let newFluxCD = callPackage ./fluxcd { }; in
    if (builtins.compareVersions newFluxCD.version prev.fluxcd.version) > 0
      then newFluxCD
      else
        builtins.trace "deprecated: override of fluxcd (${newFluxCD.version}) is outdated. Current upstream version is ${prev.fluxcd.version}." prev.fluxcd;

  inherit (callPackage ./k3s { buildGoModule = buildGo120Module; }) k3s_1_28;
  k3s = k3s_1_28;

  kubevela = callPackage ./kubevela { };

  vcluster = let newVCluster = prev.vcluster.overrideAttrs(oa: rec {
    version = "0.18.1";
    src = prev.fetchFromGitHub {
      owner = "loft-sh";
      repo = "vcluster";
      rev = "v0.18.1"; # ${version}
      hash = "sha256-TJjMB7x8MOlr3GexsnOZBFPJovVkf4ByRn1aGprvZFQ=";
    };
    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
      "-X main.goVersion=${prev.lib.getVersion final.go}"
    ];
    passthru.tests.version = prev.testers.testVersion {
      package = final.vcluster;
      command = "vcluster --version";
    };
  }); in
    if (builtins.compareVersions newVCluster.version prev.vcluster.version) > 0
      then newVCluster
      else builtins.trace "deprecated: override of vcluster (${newVCluster.version}) is outdated. Current vcluster version is ${prev.vcluster}." prev.vcluster;

}
