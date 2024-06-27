{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_MicMute"; # id
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "MicMute";
    rev = "a46e86451c7fed29ad2052c2244c9c2b37d05fc7";
    hash = "sha256-JOpklP7R9tu1tQ15WxyIIwkpqdm2TsJ0ya2Vdo69KDk=";
  };

  meta = {
    description = "Mute your microphone";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
