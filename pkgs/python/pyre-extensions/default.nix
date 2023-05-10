{ fetchPypi
, python3
, lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "pyre-extensions";
  version = "0.0.30";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-unkjxIbgia+zehBiOo9K6C1zz/QkJtcRxIrwcOW8MbI";
  };

  propagatedBuildInputs = with python3.pkgs; [
    typing-inspect
  ];

  doCheck = true;

  nativeCheckInputs = with python3.pkgs; [
    pytestCheckHook
  ];

  pythonImportsCheck = [ "pyre_extensions" ];

  meta = {
    description = "Type system extensions for use with the pyre type checker";
    downloadPage = "https://pypi.org/project/pyre-extensions/";
    homepage = "https://github.com/facebook/pyre-check";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
