{ fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_DeckPlugin";
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "DeckPlugin";
    rev = "dd053be1d541034d53b7bebf87125979fd7cdc0c";
    hash = "sha256-R9v7+7pNSpGHjONyQAUVzIcb9E28UfDAS0mOxu5ZmAA=";
  };
}
