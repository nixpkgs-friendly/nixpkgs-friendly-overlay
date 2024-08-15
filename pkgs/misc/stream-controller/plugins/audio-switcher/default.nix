{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_AudioSwitcher"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "AudioSwitcher";
    rev = "28ac24058916db19fe0681ea6ba56e0cac498cdb";
    hash = "sha256-lfa2Vv9leDCZF4Yi+xbboXet+JLyMCFxHkU9vTuyvcA=";
  };

  meta = {
    description = "Switch between audio outputs";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
