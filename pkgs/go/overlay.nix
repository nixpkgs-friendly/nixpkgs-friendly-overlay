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

  kubevela = callPackage ./kubevela { };

  vcluster = prev.vcluster.overrideAttrs(oa: rec {
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
  });

}
