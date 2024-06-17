{
  fetchFromGitHub,
  python3,
  lib,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "obs-websocket-py";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "Elektordi";
    repo = "obs-websocket-py";
    rev = version;
    hash = "sha256-yOWGgvzqjmIqV8zzrVfC1T+dwyFe5D8p5FSFeJr0TJg=";
  };

  propagatedBuildInputs = with python3.pkgs; [ websocket-client ];

  meta = {
    description = "Python library to communicate with an obs-websocket server (for OBS Studio)";
    homepage = "https://github.com/Elektordi/obs-websocket-py";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
