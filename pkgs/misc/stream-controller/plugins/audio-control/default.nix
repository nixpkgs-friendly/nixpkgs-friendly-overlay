{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_gapls_AudioControl"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "G4PLS";
    repo = "AudioControl";
    rev = "d4b6f3d39bc74504760d4cc366836b8ca6ad0e65";
    hash = "sha256-UFxbpxm3rtPs+Dg3n79Y89YLVxMZ7xa0GOHaLnUocIw=";
  };

  meta = {
    description = "This Plugin allows you to take control over your Output devices by changing the Volume, Setting the Volume or Muting devices";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
