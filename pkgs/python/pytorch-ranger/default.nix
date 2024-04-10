{
  fetchPypi,
  python3,
  lib,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "pytorch-ranger";
  version = "0.1.1";
  format = "setuptools";

  src = fetchPypi {
    pname = lib.replaceStrings [ "-" ] [ "_" ] pname;
    inherit version;
    sha256 = "sha256-qnEVQxzvEbV9fde8hucwKpEdrkZ/YuxdCxDh/3RIdds=";
  };

  propagatedBuildInputs = with python3.pkgs; [ torch ];

  doCheck = false; # No tests

  pythonImportsCheck = [ "pytorch_ranger" ];

  meta = {
    description = "Ranger - a synergistic optimizer using RAdam (Rectified Adam) and LookAhead in one codebase";
    downloadPage = "https://pypi.org/project/pytorch-ranger/";
    homepage = "https://github.com/mpariente/Ranger-Deep-Learning-Optimizer";
    license = lib.licenses.asl20;
    broken = true; # 2024-04-10
    # Could not find nvcc executable in path specified by CUDAToolkit_ROOT
  };
}
