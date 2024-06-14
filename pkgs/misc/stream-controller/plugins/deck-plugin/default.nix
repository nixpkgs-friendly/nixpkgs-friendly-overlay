{ fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_DeckPlugin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "DeckPlugin";
    rev = "060a01556e54e8d739300ab82097c93971a44d1f";
    hash = "sha256-CLzuN5YfPh2HQxCUSncBNfG8HTn1LuLLAhGjQjxGb88=";
  };
}
