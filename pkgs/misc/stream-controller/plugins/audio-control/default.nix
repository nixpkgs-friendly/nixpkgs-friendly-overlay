{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_gapls_AudioControl"; # id
  version = "1.5.0-beta.6";

  src = fetchFromGitHub {
    owner = "G4PLS";
    repo = "AudioControl";
    rev = "8a3876641ae4e42ec16bbdb760fc996b1ce27433";
    hash = "sha256-pvjYOtFtsUBOq9mOu3WHj/Pv2RkBRypbRMmFxYoXAjQ=";
  };

  meta = {
    description = "This Plugin allows you to take control over your Output devices by changing the Volume, Setting the Volume or Muting devices";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
