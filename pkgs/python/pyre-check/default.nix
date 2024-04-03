{
  fetchPypi,
  python3,
  lib,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "pyre-check";
  version = "0.9.18";
  # format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-1ettuQEacgcYns0OrzKVHkbLB2nA+Wp4/QuQ5jPJ3yw=";
  };

  # postPatch = ''
  #   substituteInPlace setup.py --replace "" ""
  # '';

  nativeBuildInputs = with python3.pkgs; [
    # setuptools
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pyre-extensions
    intervaltree
    dataclasses-json
    libcst
    psutil
    click
    testslide
    tabulate
  ];

  doCheck = false; # Tests exist but didn't trigger.

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  # ];

  # checkInputs = with python3.pkgs; [
  # ];

  pythonImportsCheck = [ "pyre_check" ];

  meta = {
    description = "";
    downloadPage = "https://pypi.org/project/pyre-check/";
    homepage = "";
    # license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
