{ fetchPypi
, lib
, python3
}:

python3.pkgs.buildPythonPackage rec {
  pname = "auto-gpt-plugin-template";
  version = "0.0.3";
  format = "pyproject";

  src = fetchPypi {
    pname = "auto_gpt_plugin_template";
    inherit version;
    sha256 = "sha256-P1ERD3jbSQqJpRQvzfRBdu8IgSWkGPUHsQDoE+pa/QY=";
  };

  nativeBuildInputs = with python3.pkgs; [
    hatchling
  ];

  doCheck = false;
}
