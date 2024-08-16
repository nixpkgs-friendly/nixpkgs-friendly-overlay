{ lib, fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_Speedtest"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Speedtest";
    rev = "2d7794259903f4c85827c2c0a2b6cb044ace3efa";
    hash = "sha256-56LaMLK3idt4SSYga6Ia+cBMlb9UiFuEc/Wy1p88YxI=";
  };

  meta = {
    description = "Check your internet speed using speedtest.ne";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
