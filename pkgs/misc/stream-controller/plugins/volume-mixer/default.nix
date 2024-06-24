{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_VolumeMixer"; # id
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "VolumeMixer";
    rev = "f49d72184645c24d7d6dc7fe109e4a27cf7201ea";
    hash = "sha256-ONQGWGk924Rc04PnfdaRGVqgFBAV6DrcmLDE+JVjZXM=";
  };

  meta = {
    description = "Mix the volume levels of different apps";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
