{
  fetchPypi,
  lib,
  python3,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "auto-gpt-plugin-template";
  version = "0.0.3";
  format = "pyproject";

  src = fetchPypi {
    pname = lib.replaceStrings [ "-" ] [ "_" ] pname;
    inherit version;
    sha256 = "sha256-P1ERD3jbSQqJpRQvzfRBdu8IgSWkGPUHsQDoE+pa/QY=";
  };

  nativeBuildInputs = with python3.pkgs; [
    hatchling
    abstract-singleton
  ];

  doCheck = false; # No tests

  pythonImportsCheck = [ "auto_gpt_plugin_template" ];

  meta = {
    description = "The template plugin for Auto-GPT";
    downloadPage = "https://pypi.org/project/auto-gpt-plugin-template/";
    homepage = "https://github.com/Significant-Gravitas/Auto-GPT-Plugin-Template";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
