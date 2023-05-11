{ buildPythonPackage
, fetchFromGitHub
, setuptools-scm
, lib
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

  doCheck = false;

  pythonImportsCheck = [ "envier" ];

  meta = {
    description = "A Python library for extracting configuration from environment variables in a declarative and (eventually) 12-factor-app-compliant way";
    homepage = "https://github.com/DataDog/envier";
    license = lib.licenses.mit;
  };
}
