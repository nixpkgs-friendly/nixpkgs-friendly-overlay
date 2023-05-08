{ fetchPypi
, python3
, lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "";
  version = "";
  # format = "pyproject";

  src = fetchPypi {
    # pname = lib.replaceStrings ["-"] ["_"] pname;
    inherit pname version;
    sha256 = "";
  };

  # postPatch = ''
  #   substituteInPlace setup.py --replace "" ""
  # '';

  nativeBuildInputs = with python3.pkgs; [
    # setuptools
  ];

  propagatedBuildInputs = with python3.pkgs; [
  ];

  doCheck = false;

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  #];

  # pythonImportsCheck = [ "" ];

  meta = {
    description = "";
    downloadPage = "";
    homepage = "";
    # license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
