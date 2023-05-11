{ buildPythonPackage
, fetchFromGitHub
, setuptools-scm
, lib
, python3
}:

buildPythonPackage rec {
  pname = "envier";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "DataDog";
    repo = "envier";
    rev = "v${version}";
    hash = "sha256-tQ4lWHsGZi1tnXTlvBCNzP3X3L3BwYPcCBp1hreMxeY=";
  };

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  nativeBuildInputs = [
    setuptools-scm
  ];

  doCheck = false; # Fix-Me: Needs work

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  #   pytest-mypy-plugins
  #   mypy-extensions
  #   pytest-mypy
  # ];

  # checkInputs = with python3.pkgs; [
  #   sphinx
  #   mypy
  #   mypy-extensions
  # ];

  pythonImportsCheck = [ "envier" ];

  meta = {
    description = "A Python library for extracting configuration from environment variables in a declarative and (eventually) 12-factor-app-compliant way";
    homepage = "https://github.com/DataDog/envier";
    license = lib.licenses.mit;
  };
}
