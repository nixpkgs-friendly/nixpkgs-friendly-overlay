{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_OSPlugin"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "OSPlugin";
    rev = "9ebf9a89063a06c776346598e9181835d78534e2";
    hash = "sha256-RpzvCtwSxXodPkTNdOCdsUtsAcCr4XTQnshrcHLRxBI=";
  };

  meta = {
    description = "Control your operating system";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
