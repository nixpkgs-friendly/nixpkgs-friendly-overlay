{
  fetchFromGitHub,
  fetchPypi,
  python3,
  lib,
  pythonOlder,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "tensorboard-data-server";
  version = "0.7.0";
  format = "wheel";
  disabled = pythonOlder "3.6";

  src = fetchPypi {
    pname = lib.replaceStrings [ "-" ] [ "_" ] pname;
    inherit version format;
    dist = "py3";
    python = "py3";
    hash = "sha256-dT1CFHmbMdp7bZODeVmr67xq+obmnqzx6aMXpI2qMes";
  };

  doCheck = false;

  pythonImportsCheck = [ "tensorboard_data_server" ];

  meta = {
    description = "Fast data loading for TensorBoard";
    downloadPage = "https://pypi.org/project/tensorboard-data-server/";
    homepage = "https://github.com/tensorflow/tensorboard/tree/master/tensorboard/data/server";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
