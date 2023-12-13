final: prev:

let
  callPackage = final.callPackage;
in
rec {

  #yandex-browser-stable = callPackage ./yandex-browser { };
  #yandex-browser-beta = yandex-browser.override({
  #  channel = "beta";
  #  version = "23.5.1.754-1";
  #  hash = "sha256-ngtwrq8vDEt39Zd5jpBadouN1V8ly03la69M0AUyhGM=";
  #});
  #yandex-browser = yandex-browser-stable;

}
