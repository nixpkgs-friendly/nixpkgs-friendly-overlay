{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_Clocks"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Clocks";
    rev = "5cf937508a60289842149f714d92e1e0cbfab51b";
    hash = "sha256-rp0L6uFS0yU5UV+tDmOgezd/mzBRx6onyGA1FM7gH0M=";
  };

  meta = {
    description = "Adds an analog and a digital clock";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
