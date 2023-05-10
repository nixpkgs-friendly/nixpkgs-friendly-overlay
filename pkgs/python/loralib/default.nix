{ fetchPypi
, python3
, lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "loralib";
  version = "0.1.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-aj2t7MFKfjjmA+hurDUps8RA8IVcPu2IVfBRxt81Y1o=";
  };

  doCheck = false;

  propagatedBuildInputs = with python3.pkgs; [
    torch
  ];

  pythonImportsCheck = [ "loralib" ];

  meta = {
    description = "PyTorch implementation of low-rank adaptation (LoRA), a parameter-efficient approach to adapt a large pre-trained deep learning model which obtains performance on-par with full model fine-tuning";
    downloadPage = "https://pypi.org/project/loralib/";
    homepage = "https://github.com/microsoft/LoRA";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
