{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_OSPlugin"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "OSPlugin";
    rev = "0104d1fe57ca4208836b55b341ed154753ba934a";
    hash = "sha256-iYpjO1viszJOegCHacf5F3Iwg7PTRzU4oF9eGIcq/hc=";
  };

  meta = {
    description = "Control your operating system";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
