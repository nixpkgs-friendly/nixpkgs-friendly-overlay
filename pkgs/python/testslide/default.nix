{ fetchPypi
, python3
, lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "testslide";
  version = "2.7.1";
  # format = "pyproject";

  src = fetchPypi {
    pname = "TestSlide";
    inherit version;
    hash = "sha256-0liQ1cOD9nP6xEpfniVhtxGNBPKfLCs9T1SebblMs00=";
  };

  # postPatch = ''
  #   substituteInPlace setup.py --replace "" ""
  # '';

  # nativeBuildInputs = with python3.pkgs; [
  #   # setuptools
  # ];

  propagatedBuildInputs = with python3.pkgs; [
    typeguard
    pygments
    psutil
  ];

  doCheck = false; # Tests exist but wasn't triggered.

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  # ];

  pythonImportsCheck = [ "testslide" ];

  meta = {
    description = "A test framework for Python that enable unit testing / TDD / BDD to be productive and enjoyable";
    downloadPage = "";
    homepage = "https://github.com/facebook/TestSlide";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
