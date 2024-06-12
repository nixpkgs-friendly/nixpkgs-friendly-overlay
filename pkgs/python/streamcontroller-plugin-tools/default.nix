{
  fetchFromGitHub,
  python3,
  lib,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "streamcontroller-plugin-tools";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "StreamController";
    repo = pname;
    rev = version;
    sha256 = "sha256-dQZPRSzHhI3X+Pf7miwJlECGFgUfp68PtvwXAmpq5/s=";
  };

  propagatedBuildInputs = with python3.pkgs; [ ];

  pythonImportsCheck = [
  ];

  doCheck = false;

  meta = {
    description = "This package contains the base for StreamController plugins";
    homepage = "https://github.com/StreamController/streamcontroller-plugin-tools";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
