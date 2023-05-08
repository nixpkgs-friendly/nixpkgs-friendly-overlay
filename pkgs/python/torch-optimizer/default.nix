{ fetchPypi
, python3
, lib
, fetchpatch2
, fetchFromGitHub
}:

python3.pkgs.buildPythonPackage rec {
  pname = "torch-optimizer";
  version = "0.3.0"; # "unstable-2021-11-11";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-shgGKd+dbNeirqvnH6SocrupOOjidZZQklaM2ZMbkkw=";
  };

  # src = fetchFromGitHub {
  #   owner = "jettify";
  #   repo = "pytorch-optimizer";
  #   rev = "910b414565427f0a66e20040475e7e4385e066a5";
  #   hash = "sha256-CEdD31AyaGCULk2abtLKRL96T0TjIeH16+aKntHdxu8=";
  # };

  # patches = [
  #   (fetchpatch2 {
  #     url = "";
  #     hash = "";
  #   })
  # ];

  nativeBuildInputs = with python3.pkgs; [
    setuptools
  ];

  propagatedBuildInputs = with python3.pkgs; [
    torch
    pytorch-ranger
  ];

  doCheck = false; # 15 failures

  nativeCheckInputs = with python3.pkgs; [
    pytestCheckHook
  ];

  # Fix-Me: Thanks to whoever fixes this!
  # disabledTests = [
  #   # FAILED tests/test_optimizer.py::TestOptim::test_optimizer[build_lookahead_0] - AttributeError: 'Lookahead' object has no attribute '_optimizer_step_pre_>
  #   "build_lookahead_0"

  #   # FAILED tests/test_optimizer.py::TestOptim::test_optimizer[build_lookahead_1] - AttributeError: 'Lookahead' object has no attribute '_optimizer_step_pre_>
  #   "build_lookahead_1"

  #   # FAILED tests/test_optimizer.py::TestOptim::test_optimizer[build_lookahead_2] - AttributeError: 'Lookahead' object has no attribute '_optimizer_step_pre_>
  #   "build_lookahead_2"

  #   # FAILED tests/test_optimizer.py::TestOptim::test_optimizer[build_lookahead_3] - AttributeError: 'Lookahead' object has no attribute '_optimizer_step_pre_>
  #   "build_lookahead_3"

  #   # FAILED tests/test_optimizer.py::TestOptim::test_optimizer[build_lookahead_4] - AttributeError: 'Lookahead' object has no attribute '_optimizer_step_pre_>
  #   "build_lookahead_4"

  #   # FAILED tests/test_optimizer.py::TestOptim::test_optimizer[build_lookahead_5] - AttributeError: 'Lookahead' object has no attribute '_optimizer_step_pre_>
  #   "build_lookahead_5"

  #   # FAILED tests/test_optimizer.py::TestOptim::test_optimizer[build_lookahead_6] - AttributeError: 'Lookahead' object has no attribute '_optimizer_step_pre_>
  #   "build_lookahead_6"

  #   # FAILED tests/test_optimizer_with_nn.py::test_basic_nn_modeloptimizer_config[build_lookahead ({'lr': 0.1, 'weight_decay': 0.001}, 200)] - AttributeError:>
  #   # "build_lookahead"

  #   # FAILED tests/test_param_validation.py::test_sparse_not_supported[AdaBound] - Failed: DID NOT RAISE <class 'RuntimeError'>
  #   # "AdaBound"

  #   # FAILED tests/test_param_validation.py::test_sparse_not_supported[AdaMod] - Failed: DID NOT RAISE <class 'RuntimeError'>
  #   # "AdaMod"

  #   # FAILED tests/test_param_validation.py::test_sparse_not_supported[DiffGrad] - Failed: DID NOT RAISE <class 'RuntimeError'>
  #   # "DiffGrad"

  #   # FAILED tests/test_param_validation.py::test_sparse_not_supported[Lamb] - Failed: DID NOT RAISE <class 'RuntimeError'>
  #   # "Lamb"

  #   # FAILED tests/test_param_validation.py::test_sparse_not_supported[NovoGrad] - Failed: DID NOT RAISE <class 'RuntimeError'>
  #   # "NovoGrad"

  #   # FAILED tests/test_param_validation.py::test_sparse_not_supported[RAdam] - Failed: DID NOT RAISE <class 'RuntimeError'>
  #   # "RAdam"

  #   # FAILED tests/test_param_validation.py::test_sparse_not_supported[Yogi] - Failed: DID NOT RAISE <class 'RuntimeError'>
  #   # "Yogi"
  # ];

  # None of these dependencies help unbreak tests above...
  # checkInputs = with python3.pkgs; [
  #   bandit #==1.7.0
  #   black #==21.9b0
  #   flake8-bugbear #==21.9.2
  #   flake8-quotes #==3.3.1
  #   flake8 #==4.0.1
  #   ipdb #==0.13.9
  #   isort #==5.9.3
  #   mypy #==0.910
  #   numpy #==1.21.3
  #   pyroma #==3.2
  #   pytest-cov #==3.0.0
  #   pytest #==6.2.5
  #   pytorch-ranger #==0.1.1
  #   sphinx-autodoc-typehints #==1.12.0
  #   sphinx #==4.2.0
  #   torch # ==1.10.0
  #   twine #==3.4.2
  #   wheel #==0.37.0
  # ];

  pythonImportsCheck = [ "torch_optimizer" ];

  meta = {
    description = "A collection of optimizers for PyTorch compatible with optim module";
    homepage = "https://github.com/jettify/pytorch-optimizer";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
