{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_VolumeMixer"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "VolumeMixer";
    rev = "d86db67804d59378562d93a8171280db756c2000";
    hash = "sha256-f5BAv5/h6lz2reXnmY2DM8VRqVzyOm/NpRIlK5ooCw4=";
  };

  meta = {
    description = "Mix the volume levels of different apps";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
