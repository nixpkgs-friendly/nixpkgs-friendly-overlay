{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_OSPlugin"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "OSPlugin";
    rev = "d41fb1657ad4b33cb348f76074d2fad2861091c9";
    hash = "sha256-6Ys0ER03znCw/QijJnA7cx2UBKMuddDFJML8Xm0h8gc=";
  };

  meta = {
    description = "Control your operating system";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
