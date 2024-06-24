{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_Counter"; # id
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Counter";
    rev = "685b21c92ed799e67d385f7e16d211aef3d952d9";
    hash = "sha256-u6dHHg8HRMC9G5jqk9Xby672y2YxtkGCdK37e2h/0oY=";
  };

  meta = {
    description = "A simple counter that increases on press and can be configured to either decrease or reset on a long press. You can also configure the counter to store the current value in a txt file to use in other apps like OBS.";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
