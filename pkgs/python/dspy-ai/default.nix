{
  fetchPypi,
  fetchFromGitHub,
  python3,
  lib,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "dspy-ai";
  # version = "2.4.0";
  version = "2.4.0-unstable-2024-03-10";
  format = "setuptools";

  # Errors as:
  #   FileNotFoundError: [Errno 2] No such file or directory: 'requirements.txt'
  # src = fetchPypi {
  #   inherit pname version;
  #   hash = "sha256-1kbsAVJwtwvVGRY0bAFoCSPM+jhsnlR0yqxtQ2YUhng=";
  # };

  src = fetchFromGitHub {
    owner = "stanfordnlp";
    repo = "dspy";
    rev = "0c1d1b1b2c9b5d6dc6d565a84bfd8f17c273669d";
    hash = "sha256-U+GECfY1bi1x9BeAsx2pdM7V8p/JD+PQtq9wheSeuQM=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    backoff
    joblib
    openai
    pandas
    regex
    ujson
    tqdm
    datasets
    requests
    optuna
    pydantic
  ];

  HOME = "."; # Permission denied: '/homeless-shelter'

  doCheck = false;

  pythonImportsCheck = [
    "dsp"
    "dspy"
  ];

  meta = {
    description = "A framework for algorithmically optimizing LM prompts and weights, especially when LMs are used one or more times within a pipeline";
    downloadPage = "https://pypi.org/project/dspy-ai/";
    homepage = "https://github.com/stanfordnlp/dspy";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ superherointj ];
  };
}
