{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_MicMute"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "MicMute";
    rev = "2ffb9309b47e554f860cd5e55d10d35073c64b54";
    hash = "sha256-g82nKj9NMGrS+IoZMXyxtcFOT+v/OMkcKvMGDbsje5I=";
  };

  meta = {
    description = "Mute your microphone";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
