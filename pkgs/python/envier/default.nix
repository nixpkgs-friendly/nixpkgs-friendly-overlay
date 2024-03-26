{ buildPythonPackage, fetchFromGitHub, setuptools-scm, lib, python3, hatchling
, hatch-vcs }:

buildPythonPackage rec {
  pname = "envier";
  version = "0.5.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "DataDog";
    repo = "envier";
    rev = "v${version}";
    hash = "sha256-yWA9rNiKAkyQXFRFa/ggyih3aiqWsa37042Z8NoaGb0=";
  };

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  nativeBuildInputs = [ setuptools-scm ];

  propagatedBuildInputs = [ hatchling hatch-vcs ];

  doCheck = false; # Fix-Me: Needs work

  # Check for dependencies at:
  # https://github.com/DataDog/envier/blob/main/pyproject.toml

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
    description =
      "A Python library for extracting configuration from environment variables in a declarative and (eventually) 12-factor-app-compliant way";
    homepage = "https://github.com/DataDog/envier";
    license = lib.licenses.mit;
  };
}
