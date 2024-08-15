{ fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_MediaPlugin";
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "MediaPlugin";
    rev = "c0d93146a899ab22d67cf897a1a2137ef55ea764";
    hash = "sha256-rVCj2o/SKa4LBonSlcwGTEZdxz1Q+wOLSzCRGg8gxNw=";
  };
}
