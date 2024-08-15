{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_MicMute"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "MicMute";
    rev = "c78789dc79f4eafd23584e7a4cab83436fd132de";
    hash = "sha256-4PanHn8Fpr8Oc2CZqB4LUuR9LGv0Bu9LNFqcpKV1uMQ=";
  };

  meta = {
    description = "Mute your microphone";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
