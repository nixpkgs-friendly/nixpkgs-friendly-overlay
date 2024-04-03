{
  fetchFromGitHub,
  python3,
  lib,
  git,
  which,
}:

let
  flash-attention = fetchFromGitHub {
    owner = "HazyResearch";
    repo = "flash-attention";
    rev = "v1.0.4";
    hash = "sha256-UoMw30qxPmsNNUGh5AOk0T4AmWlW//4616bImN3Cx10=";
  };

  cutlass = fetchFromGitHub {
    owner = "NVIDIA";
    repo = "cutlass";
    rev = "v3.0.0";
    hash = "sha256-YPD5Sy6SvByjIcGtgeGH80TEKg2BtqJWSg46RvnJChY=";
  };
in
python3.pkgs.buildPythonPackage rec {
  pname = "xformers";
  version = "0.0.19";

  src = fetchFromGitHub {
    owner = "facebookresearch";
    repo = "xformers";
    rev = "v${version}";
    hash = "sha256-M+HMJSz5R8kO3XMODKpUY07jMxEMo2wzzP3w7eX0H24=";
  };

  postUnpack = ''
    rm -rf $sourceRoot/third_party/flash-attention
    rm -rf $sourceRoot/third_party/cutlass
    ln -s ${flash-attention} $sourceRoot/third_party/flash-attention
    ln -s ${cutlass} $sourceRoot/third_party/cutlass
  '';

  postPatch = ''
    substituteInPlace requirements.txt --replace "pyre-extensions == 0.0.29" "pyre-extensions"
  '';

  BUILD_VERSION = version;
  # TORCH_CUDA_ARCH_LIST
  # XFORMERS_DISABLE_FLASH_ATTN = "0";

  nativeBuildInputs = with python3.pkgs; [ which ];

  propagatedBuildInputs = with python3.pkgs; [
    torch
    numpy
    pyre-extensions
  ];

  doCheck = false; # Fix-Me

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  # ];

  # checkInputs = with python3.pkgs; [
  #   python-dotenv

  #   # Tools for static checking.
  #   black #== 22.3.0
  #   flake8 #== 3.8.4
  #   # flake8-copyright
  #   isort #== 5.7.0
  #   mypy #== 0.982
  #   # pyre-check #== 0.9.16
  #   pyre-extensions #== 0.0.29
  #   click #== 8.0.4
  #   protobuf #==3.20.2

  #   # Tools for unit tests & coverage.
  #   # pytest == 7.2.0
  #   pytest-cov #== 2.10.0
  #   # pytest-mpi #== 0.4
  #   pytest-timeout #== 1.4.2
  #   #git+https://github.com/rwightman/pytorch-image-models@v0.4.5#egg=timm

  #   # Dependency for factory
  #   hydra-core# >= 1.1

  #   # Dependency for Mixture of Experts
  #   # fairscale #>= 0.4.5
  #   scipy

  #   # Dependency for fused layers, optional
  #   # pkgs.cmake
  #   #triton==2.0.0.dev20221105
  #   #git+https://github.com/openai/triton.git#subdirectory=python&egg=triton
  #   # git+https://github.com/fmassa/triton.git@max_jobs#subdirectory=python&egg=triton
  #   networkx
  # ];

  pythonImportsCheck = [ "xformers" ];

  meta = {
    description = "Toolbox to accelerate research on transformers";
    downloadPage = "https://pypi.org/project/xformers/";
    homepage = "https://github.com/facebookresearch/xformers";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
  };
}
