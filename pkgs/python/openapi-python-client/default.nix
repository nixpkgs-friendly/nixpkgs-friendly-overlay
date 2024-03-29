{ fetchPypi, python3, lib }:

python3.pkgs.buildPythonPackage rec {
  pname = "openapi-python-client";
  version = "0.14.0";
  format = "pyproject";

  src = fetchPypi {
    pname = lib.replaceStrings [ "-" ] [ "_" ] pname;
    inherit version;
    sha256 = "sha256-R/mG9DSUogNSHqAeBfdxL2HUvkHNu9kMJuFcu6G7kLs=";
  };

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
    pyyaml
    typer
    autoflake
    httpx
    python-dateutil
    jinja2
    black
    pydantic
    attrs
    isort
    shellingham
  ];

  doCheck = false;
}
