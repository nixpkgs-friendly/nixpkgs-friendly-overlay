{ fetchPypi
, python3
}:

python3.pkgs.buildPythonPackage rec {
  pname = "abstract-singleton";
  version = "1.0.1";
  format = "pyproject";

  src = fetchPypi {
    pname = "abstract_singleton";
    inherit version;
    sha256 = "sha256-2X0m7Ly3Qi943xsLykigPfW6BM9YhExtoDOnhAvqroI=";
  };

  nativeBuildInputs = with python3.pkgs; [
    hatchling
  ];

  doCheck = false;
}
