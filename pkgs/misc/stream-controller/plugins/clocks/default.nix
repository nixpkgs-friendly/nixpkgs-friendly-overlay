{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_Clocks"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Clocks";
    rev = "382410fe55646e76420d5eea7598e405e69d7f3e";
    hash = "sha256-s5tV70NTxg8Du5sRUABtQob7ItyPWHDWfeJG9Lz1vag=";
  };

  meta = {
    description = "Adds an analog and a digital clock";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
