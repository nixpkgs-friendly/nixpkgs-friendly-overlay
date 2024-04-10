{
  fetchPypi,
  python3,
  lib,
}:

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

  meta = {
    # Checking runtime dependencies for openapi_python_client-0.14.0-py3-none-any.whl
    # - httpx<0.25.0,>=0.15.4 not satisfied by version 0.27.0
    # - pydantic<2.0.0,>=1.6.1 not satisfied by version 2.6.3
    # - typer<0.8.0,>=0.6 not satisfied by version 0.9.0
    broken = true; # 2024-04-10
  };
}
