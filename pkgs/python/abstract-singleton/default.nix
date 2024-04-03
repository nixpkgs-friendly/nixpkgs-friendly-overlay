{
  fetchPypi,
  python3,
  lib,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "abstract-singleton";
  version = "1.0.1";
  format = "pyproject";

  src = fetchPypi {
    pname = lib.replaceStrings [ "-" ] [ "_" ] pname;
    inherit version;
    sha256 = "sha256-2X0m7Ly3Qi943xsLykigPfW6BM9YhExtoDOnhAvqroI=";
  };

  nativeBuildInputs = with python3.pkgs; [ hatchling ];

  doCheck = false; # No test

  pythonImportsCheck = [ "abstract_singleton" ];

  meta = {
    description = "An abstract singleton class that enforces abstract methods are implemented";
    downloadPage = "https://pypi.org/project/abstract-singleton/";
    homepage = "https://github.com/BillSchumacher/Abstract-Singleton";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
