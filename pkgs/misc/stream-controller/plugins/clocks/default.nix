{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_Clocks"; # id
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Clocks";
    rev = "537af8606b606bef3ce78936a0e85e9986967b4b";
    hash = "sha256-X6hK/xrBy42RXcZaPT7b6BcgnxPazBshL2ExABSUfis=";
  };

  meta = {
    description = "Adds an analog and a digital clock";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
