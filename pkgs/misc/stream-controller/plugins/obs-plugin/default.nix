{ stdenv, lib, fetchFromGitHub, stream-controller }:

stream-controller.python.pkgs.buildPythonPackage rec {
# stdenv.mkDerivation rec {
  pname = "com_core447_OBSPlugin";
  version = "1.5.1-beta";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "OBSPlugin";
    rev = "1ba0ed75d6466192d8561ca88ad93822839d9b60";
    hash = "sha256-8VjGsG4iSe7+blRd3w/1xIeIb3Ad3yyZq7utB/u+cgA=";
  };

  pyproject = false;

  propagatedBuildInputs = with stream-controller.python.pkgs; [
    loguru
    rpyc
    serpent
    streamcontroller-plugin-tools
    websocket-client
    obs-websocket-py
  ];

  pypaInstallPhase = null;

  postInstall = ''
    mkdir -p $out/plugins/${pname}
    cp -r ./ $out/plugins/${pname}

    mkdir -p $out/plugins/${pname}/backend/.venv/bin

    echo "export PYTHONPATH=$PYTHONPATH:${lib.makeLibraryPath propagatedBuildInputs}" > $out/plugins/${pname}/backend/.venv/bin/activate

    touch $out/plugins/${pname}/git-rev
    echo "${src.rev}" > $out/plugins/${pname}/git-rev
  '';

  meta = {
    description = "A simple counter that increases on press and can be configured to either decrease or reset on a long press. You can also configure the counter to store the current value in a txt file to use in other apps like OBS.";
    downloadPage = ""; # Store page?
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
