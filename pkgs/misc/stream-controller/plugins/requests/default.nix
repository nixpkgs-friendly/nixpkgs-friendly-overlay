{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_core447_Requests"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Requests";
    rev = "bfe1fa16fa3e8a2162774f6771ed1ec218af392b";
    hash = "sha256-jmx3SDY7MlCjcf14+1xf7zOohZFy2XGYSbpPQ8TpdM0=";
  };

  meta = {
    description = "Send HTTP requests to control smart devices";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
