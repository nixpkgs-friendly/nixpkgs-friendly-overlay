{ fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_MediaPlugin";
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "MediaPlugin";
    rev = "d59517f5ac2fc0a39a7c5cfb6f91d7b0852804b9";
    hash = "sha256-Aw3cPZ6sO1ut+vStzDiXMWUwIfkcMn//eJ50eQDMSk8=";
  };
}
