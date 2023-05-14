{ fetchPypi
, fetchFromGitHub
, python3
, lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "ml-dtypes";
  version = "0.1.0";
  format = "setuptools";

  # src = fetchFromGitHub {
  #   owner = "jax-ml";
  #   repo = "ml_dtypes";
  #   rev = "v${version}";
  #   hash = "sha256-cNUvpHDphd+7Zfok0AmdpIaXn2xiXl6jf7tJPD08Zq4=";
  # };

  src = fetchPypi {
    pname = lib.replaceStrings ["-"] ["_"] pname;
    inherit version;
    sha256 = "sha256-wfwK/mPOmQafnX4Gk6Yc/QrqkCQfw4Ia+ZU9DBH0BIo=";
  };

  # postPatch = ''
  #   substituteInPlace setup.py --replace "" ""
  # '';

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    pybind11
  ];

    # typing-extensions

  propagatedBuildInputs = with python3.pkgs; [
    numpy
  ];

  doCheck = false;

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  # ];

  # checkInputs = with python3.pkgs; [
  #   absl-py
  #   pytest-xdist
  #   # pyink
  # ];

  # pythonImportsCheck = [ "" ];

  meta = {
    description = "A stand-alone implementation of several NumPy dtype extensions used in machine learning";
    downloadPage = "";
    homepage = "https://github.com/jax-ml/ml_dtypes";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
