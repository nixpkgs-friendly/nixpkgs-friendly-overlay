{ fetchPypi
, python3
, lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "composer";
  version = "0.14.1";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-NwEZVZtlrUpLZ8Tr4CzAw54XtpbifjtlF3uzrE0K52g=";
  };

  # torchmetrics pinning PR:
  # https://github.com/mosaicml/composer/pull/2065
  postPatch = ''
    substituteInPlace setup.py \
      --replace "packaging>=21.3.0,<23" "packaging" \
      --replace "torchmetrics>=0.10.0,<0.11.4" "torchmetrics"
  '';

  nativeBuildInputs = with python3.pkgs; [
    setuptools
  ];

  propagatedBuildInputs = with python3.pkgs; [
    torchvision
    py-cpuinfo
    packaging
    torch-optimizer
    torchmetrics
    tqdm
    importlib-metadata
    tabulate
    psutil
    coolname
  ];

  doCheck = false;

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  # ];

  # checkInputs = with python3.pkgs; [
  #   # 'custom_inherit==2.4.1',
  #   # 'junitparser==3.1.0',
  #   # 'coverage[toml]==7.2.5',
  #   fasteners #==0.18',  # object store tests require fasteners
  #   # 'pytest==7.3.1',
  #   toml
  #   # 'ipython==8.11.0',
  #   # 'ipykernel==6.22.0',
  #   # 'jupyter==1.0.0',
  #   # 'yamllint==1.31.0',
  #   # 'recommonmark==0.7.1',
  #   # 'sphinx==4.4.0',
  #   # 'pre-commit>=2.18.1,<3',
  #   # # embedding md in rst require docutils>=0.17. See
  #   # # https://myst-parser.readthedocs.io/en/latest/sphinx/use.html?highlight=parser#include-markdown-files-into-an-rst-file
  #   # 'docutils==0.17.1',
  #   # 'sphinx_markdown_tables==0.0.17',
  #   # 'sphinx-argparse==0.4.0',
  #   # 'sphinxcontrib.katex==0.9.4',
  #   # 'sphinxext.opengraph==0.8.2',
  #   # 'sphinxemoji==0.2.0',
  #   furo # ==2022.9.29',
  #   # 'sphinx-copybutton==0.5.2',
  #   # 'testbook==0.4.2',
  #   # 'myst-parser==0.16.1',
  #   # 'sphinx_panels==0.6.0',
  #   # 'sphinxcontrib-images==0.9.4',
  #   # 'pytest_codeblocks==0.16.1',
  #   # 'traitlets==5.9.0',
  #   # 'nbsphinx==0.9.1',
  #   # 'pandoc==2.3',
  #   # 'pypandoc==1.11',
  #   # 'GitPython==3.1.31',
  #   # 'moto[s3]>=4.0.1,<5',
  #   # 'mock-ssh-server==0.9.1',
  #   cryptography #==38.0.4',
  #   pytest-httpserver #>=1.0.4,<1.1',
  #   # 'setuptools<=59.5.0',
  # ];

  pythonImportsCheck = [ "composer" ];

  meta = {
    description = "Composer is a PyTorch library that enables you to train neural networks faster, at lower cost, and to higher accuracy";
    license = lib.licenses.asl20;
    homepage = "https://github.com/mosaicml/composer";
    maintainers = with lib.maintainers; [ ];
  };
}
