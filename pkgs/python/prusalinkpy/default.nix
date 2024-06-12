{
  fetchPypi,
  python3,
  lib,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "prusalinkpy";
  version = "2.2.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-SRbDr5KFJkkKaL18CjVMhZGI9ciqqbSekHI7InuD9Ak=";
  };

  propagatedBuildInputs = with python3.pkgs; [ requests ];

  meta = {
    description = "A library to interface with the PrusaLink API";
    homepage = "https://github.com/guillaume-rico/PrusaLinkPy";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
