final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
rec {

  # Fix-Me: Remove after https://github.com/NixOS/nixpkgs/pull/273564/ reaches nixos-unstable.
  # https://nixpk.gs/pr-tracker.html?pr=273564
  corectrl = let newCorectrl = prev.corectrl.overrideAttrs(oa: rec {
      version = "1.3.8";
      src = prev.fetchFromGitLab {
        owner = "corectrl";
        repo = "corectrl";
        rev = "v${version}";
        hash = "sha256-lc6yWzJiSzGKMzJIpgOtirJONsh49vXWDWrhLV/erwQ=";
      };
      patches = [
        # https://github.com/NixOS/nixpkgs/pull/273564/
        (prev.fetchpatch {
          name = "polkit-dir.patch";
          url = "https://raw.githubusercontent.com/K900/nixpkgs/94d828a5033b688af09b02983aad37ecf529bf3c/pkgs/applications/misc/corectrl/polkit-dir.patch";
          hash = "sha256-ZOBvm7uXEjtaRhqJE9D4KYWj1lmSGQoHplUY1yo71b4=";
        })
      ];
    });
    in
      pickLatest newCorectrl prev.corectrl;

  #yandex-browser-stable = callPackage ./yandex-browser { };
  #yandex-browser-beta = yandex-browser.override({
  #  channel = "beta";
  #  version = "23.5.1.754-1";
  #  hash = "sha256-ngtwrq8vDEt39Zd5jpBadouN1V8ly03la69M0AUyhGM=";
  #});
  #yandex-browser = yandex-browser-stable;

}
