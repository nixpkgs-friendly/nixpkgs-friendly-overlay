{ fetchPypi
, python3
, lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "coolname";
  version = "2.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-bF1XMXWRBEeefKGVqbZPeQCsW+rUAYPAkyPH0L6edcc=";
  };

  nativeCheckInputs = with python3.pkgs; [ pytestCheckHook ];

  pythonImportsCheck = [ "coolname" ];

  meta = {
    description = "Random name and slug generator";
    downloadPage = "https://pypi.org/project/coolname/";
    homepage = "https://github.com/alexanderlukanin13/coolname";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ ];
  };
}
