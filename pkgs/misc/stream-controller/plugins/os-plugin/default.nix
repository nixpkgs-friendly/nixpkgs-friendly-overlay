{
  fetchFromGitHub,
  lib,
  stdenv,
  stream-controller,
}:

stdenv.mkDerivation rec {
  pname = "com_core447_OSPlugin"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "OSPlugin";
    rev = "d208a196bf97369b55df923ab8a5130961485481";
    hash = "sha256-w8vc0o6HU4Utx7nHIKleCPHu96RZ5E8B+3FVuZCFbbQ=";
  };

  installPhase = ''
    mkdir -p $out/plugins/${pname}
    cp -r ./ $out/plugins/${pname}
  '';

  meta = {
    description = "Control your operating system";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
