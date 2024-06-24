{ lib, fetchFromGitHub, stream-controller-plugins }:

stream-controller-plugins.mkPlugin {
  pname = "com_core447_Speedtest"; # id
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Speedtest";
    rev = "bb9931be9460810fbf1bd6f5fdde57cd94262dd5";
    hash = "sha256-XRvSssBSZB9IdqH3CDcUxsYuoju3gSQilnZnZX7cPy4=";
  };

  meta = {
    description = "Check your internet speed using speedtest.ne";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
