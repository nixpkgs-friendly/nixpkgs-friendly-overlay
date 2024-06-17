{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_Counter"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Counter";
    rev = "7f3351b55427fa97419b9bde740dd192d1b91791";
    hash = "sha256-1Qtl8vdvFGLukKFTphUJgTOFaA6MYQuK1KpWGLIkFLA=";
  };

  meta = {
    description = "A simple counter that increases on press and can be configured to either decrease or reset on a long press. You can also configure the counter to store the current value in a txt file to use in other apps like OBS.";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
