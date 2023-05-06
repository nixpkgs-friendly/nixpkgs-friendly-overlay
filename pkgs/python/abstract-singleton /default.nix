{ fetchPypi
, lib
, python3
}:

python3.pkgs.buildPythonPackage rec {
  pname = "abstract-singleton";
  version = "1.0.1";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "";
  };

  nativeBuildInputs = with python3.pkgs; [

  ];

  doCheck = false;
}
