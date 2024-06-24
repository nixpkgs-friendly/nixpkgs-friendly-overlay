{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_OSPlugin"; # id
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "OSPlugin";
    rev = "3f44de60e91def8ecf93d1527370b601114681f2";
    hash = "sha256-dJL0GReI3CCLnUuZF92wXqZdbgGfX0MMAv3Dy+586II=";
  };

  meta = {
    description = "Control your operating system";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
