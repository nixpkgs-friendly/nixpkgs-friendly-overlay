{ buildPythonPackage
, fetchFromGitHub
, fetchPypi
, setuptools-scm
, setuptools
, importlib-metadata
, hatchling
, deprecated
, lib
, python3
}:

buildPythonPackage rec {
  pname = "opentelemetry-api";
  version = "1.17.0";

  format = "pyproject";

  # src = fetchPypi {
  #   pname = "opentelemetry_api";
  #   inherit version;
  #   hash = "sha256-NID89reDvl1ECiJqUduXnM18SaLpjRx0fJkQMTSNzwQ=";
  # };

  src = fetchFromGitHub {
    owner = "open-telemetry";
    repo = "opentelemetry-python";
    rev = "v${version}";
    hash = "sha256-vYbkdDcmekT7hhFb/ivp5/0QakHd0DzMRLZEIjVgXkE=";
  };

  sourceRoot = "source/opentelemetry-api";

  nativeBuildInputs = [
    setuptools
    hatchling
  ];

  buildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    deprecated
    importlib-metadata
  ];

  doCheck = false; # Errors, needs work.

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  # ];

  # checkInputs = with python3.pkgs; [
  # ];

  pythonImportsCheck = [ "opentelemetry" ];

  meta = {
    description = "OpenTelemetry Python API";
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/opentelemetry-api";
    license = lib.licenses.asl20;
  };
}
