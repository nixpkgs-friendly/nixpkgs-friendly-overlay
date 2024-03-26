{ buildPythonPackage, fetchFromGitHub, lib, protobuf, six, setuptools-scm }:

buildPythonPackage rec {
  pname = "ddsketch";
  version = "2.0.4";

  src = fetchFromGitHub {
    owner = "datadog";
    repo = "sketches-py";
    rev = "v${version}";
    hash = "sha256-W0syL+VaRIMuQf3ke3BcPxb4bI2lFI77biL35vEtRaA=";
    # leaveDotGit = true;
  };

  nativeBuildInputs = [ setuptools-scm ];

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  buildInputs = [ protobuf six ];

  doCheck = false;

  checkPythonImports = [ "ddsketch" ];

  meta = {
    description =
      "Python implementations of the distributed quantile sketch algorithm DDSketch";
    homepage = "https://github.com/datadog/sketches-py";
    license = lib.licenses.asl20;
  };
}
