final: prev:

let
  callPackage = final.callPackage;
  buildGo120Module = final.buildGo120Module;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in

rec {
  fluxcd = pickLatest (callPackage ./fluxcd { }) prev.fluxcd;

  # k3s_1_28 = pickLatest (callPackage ./k3s { buildGoModule = buildGo120Module; }).k3s_1_28 (prev.k3s_1_28 or null);
  # k3s = pickLatest k3s_1_28 prev.k3s;

  kubevela = pickLatest (callPackage ./kubevela { }) (prev.kubevela or null);

  vcluster = let newVCluster = prev.vcluster.overrideAttrs(oa:
    rec {
      version = "0.18.1";
      src = prev.fetchFromGitHub {
        owner = "loft-sh";
        repo = "vcluster";
        rev = "v${version}";
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
    }); in pickLatest newVCluster prev.vcluster;

}
