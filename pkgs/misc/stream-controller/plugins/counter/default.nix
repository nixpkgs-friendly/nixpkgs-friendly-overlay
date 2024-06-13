{
  fetchFromGitHub,
  lib,
  stdenv,
  stream-controller,
}:

stdenv.mkDerivation rec {
  pname = "com_core447_Counter"; # id
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "Counter";
    rev = "b1782f5b83bbf74a0cac7f90e1fe639e21c2c16f";
    hash = "sha256-ctmreRNNVwBB4ObaJFXc6ecj/G2FMcjW7/CjikcaNOs=";
  };

  installPhase = ''
    mkdir -p $out/plugins/${pname}
    cp -r ./ $out/plugins/${pname}
  '';

  meta = {
    description = "A simple counter that increases on press and can be configured to either decrease or reset on a long press. You can also configure the counter to store the current value in a txt file to use in other apps like OBS.";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
