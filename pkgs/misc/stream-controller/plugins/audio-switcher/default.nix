{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_AudioSwitcher"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "AudioSwitcher";
    rev = "a194fb5595b4fae5f93b079badfa60c10315ae66";
    hash = "sha256-zJeQHPTePtpsC7uXd93hkQ1/gbF2AYfngr4HDpAOF1c=";
  };

  meta = {
    description = "Switch between audio outputs";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
