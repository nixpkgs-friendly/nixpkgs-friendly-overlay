{ fetchPypi
, python3
, lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "flake8-quotes";
  version = "3.3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-biaJK2MtrLpRe/JyGcRZqDltz6wPXoIEkExaS6m0gOE=";
  };

  nativeBuildInputs = with python3.pkgs; [
    flake8
  ];

  doCheck = true;

  nativeCheckInputs = with python3.pkgs; [
    pytestCheckHook
  ];

  pythonImportsCheck = [ "flake8_quotes" ];

  meta = {
    description = "Flake8 extension for checking quotes in Python";
    downloadPage = "https://pypi.org/project/flake8-quotes/";
    homepage = "https://github.com/zheller/flake8-quotes/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
