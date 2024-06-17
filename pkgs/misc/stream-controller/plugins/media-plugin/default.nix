{ fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_MediaPlugin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "MediaPlugin";
    rev = "d29800a9c3c99511440f998e989107757e4f330a";
    hash = "sha256-3yDxNFXtT40F5ga6T2sa3xXm65WAdUaD/2gJa56zaUE=";
  };
}
