{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_Battery"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Battery";
    rev = "62b10d9aec5dbb1a337c579996e4c3887d12aba7";
    hash = "sha256-jfP0xuIGzKkv5bA1zDOED6VB7m4lrZArYDQRhtlw9JY=";
  };

  meta = {
    description = "Show the battery percentage of all devices implementing org.freedesktop.UPower";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
