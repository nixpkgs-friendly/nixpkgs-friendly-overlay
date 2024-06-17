{ fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_DeckPlugin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "DeckPlugin";
    rev = "63517f8d4056a7fb6cd679e32fee9b9cb7d6465d";
    hash = "sha256-VzD3ZWvOQOCGnymtn7p1kVeYPf5xeqa17igINAUxsNk=";
  };
}
