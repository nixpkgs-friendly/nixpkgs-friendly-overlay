{ fetchFromGitHub
, lib
, python3
}:

python3.pkgs.buildPythonPackage rec {
  pname = "webdriver-manager";
  version = "3.8.6";

  src = fetchFromGitHub {
    owner = "SergeyPirogov";
    repo = lib.replaceStrings ["-"] ["_"] pname;
    rev = "v${version}";
    hash = "sha256-5fyzwoqbW5Nkt+YDltnHk+OizlZC7wpSNzmz8apEPu4=";
  };

  # nativeBuildInputs = with python3.pkgs; [ ];

  propagatedBuildInputs = with python3.pkgs; [
    requests
    python-dotenv
    tqdm
    packaging
  ];

  doCheck = false;

  # nativeCheckInputs = with python3.pkgs; [
  #   pytestCheckHook
  #   selenium
  #   # browsers # Needs to be packaged.
  # ];

  pythonImportsCheck = [ "webdriver_manager" ];

  meta = {
    description = "A Python library that simplifies management of binary drivers for browsers";
    homepage = "https://github.com/SergeyPirogov/webdriver_manager/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
