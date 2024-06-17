{ stdenv, lib, fetchFromGitHub, stream-controller }:

stream-controller.python.pkgs.buildPythonPackage rec {
# stdenv.mkDerivation rec {
  pname = "com_core447_OBSPlugin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = "OBSPlugin";
    rev = "c35499cbe623d1094c78fa33f8f7927bf01d5aa9";
    hash = "sha256-GISbmD8flAiYZyO/weP2nLfnaNACa/4W11GWKUfr63o=";
  };

  postPatch = ''
    rm __install__.py
    #substituteInPlace __install__.py --replace-fail \
    #  'join(toplevel, "backend", "requirements.txt")' "None"

    #substituteInPlace main.py --replace-fail \
    #  'os.path.join(self.PATH, "backend", ".venv")' "None"
  '';

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
    echo "export PYTHONHOME=:${stream-controller.python.interpreter}" >> $out/plugins/${pname}/backend/.venv/bin/activate

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
