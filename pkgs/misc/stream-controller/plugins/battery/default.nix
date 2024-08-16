{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_Battery"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Battery";
    rev = "e6e8ed12c24780f7c735f45f5c1c3de314725192";
    hash = "sha256-eOZaHN9dh6XBcDC5j+zriX2ooXEgzaS3F6IzUOpWm5s=";
  };

  meta = {
    description = "Show the battery percentage of all devices implementing org.freedesktop.UPower";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
