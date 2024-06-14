{ fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_MediaPlugin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "MediaPlugin";
    rev = "639dc0b9386d903c9988a6471646f60b3884fd53";
    hash = "sha256-laIH2MUmVsT1Aydus5UjzTVwUgQUuo66EiGBrBmenNU=";
  };
}
