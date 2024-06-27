{ fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_DeckPlugin";
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "DeckPlugin";
    rev = "7caa40335b08994902403ed651367913694e22d8";
    hash = "sha256-7nkC+h6o6hJuugZ+IpwNtcpWkyVVO3L2rrsga5+HN4c=";
  };
}
