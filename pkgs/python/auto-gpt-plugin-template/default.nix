{ fetchPypi
, lib
, python3
}:

python3.pkgs.buildPythonPackage rec {
  pname = "auto-gpt-plugin-template";
  version = "0.0.3";
  format = "pyproject";

  src = fetchPypi {
    pname = lib.replaceStrings ["-"] ["_"] pname;
    inherit version;
    sha256 = "sha256-P1ERD3jbSQqJpRQvzfRBdu8IgSWkGPUHsQDoE+pa/QY=";
  };

  nativeBuildInputs = with python3.pkgs; [
    hatchling
    abstract-singleton
  ];

  doCheck = false;
}
