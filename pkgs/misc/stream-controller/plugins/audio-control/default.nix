{ lib, fetchFromGitHub, stream-controller-plugins }:


stream-controller-plugins.mkPlugin {
  pname = "com_gapls_AudioControl"; # id
  version = "1.5.0-beta.5";

  src = fetchFromGitHub {
    owner = "G4PLS";
    repo = "AudioControl";
    rev = "d0581796a4a07692b07a2d2e415dcf2e186a0c9b";
    hash = "sha256-Rg+Of/MzDI1PHKbf1SNIedOhmlzIzkKLslr6yiiDkWQ=";
  };

  meta = {
    description = "This Plugin allows you to take control over your Output devices by changing the Volume, Setting the Volume or Muting devices";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
