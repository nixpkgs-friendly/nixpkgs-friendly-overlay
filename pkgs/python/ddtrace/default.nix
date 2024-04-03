{
  pkgs,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  cython,
  setuptools-scm,
  ddsketch,
  packaging,
  protobuf,
  tenacity,
  attrs,
  cattrs,
  six,
  typing-extensions,
  jsonschema,
  xmltodict,
  envier,
  opentelemetry-api,
  callPackage,
  #, libddwaf
  bytecode,
  ...
}:

let
  libddwaf = pkgs.callPackage ./libddwaf.nix { };
in
buildPythonPackage rec {
  pname = "ddtrace";
  version = "1.11.1";

  src = fetchPypi {
    inherit version pname;
    hash = "sha256-AaoI9XNozYhCkau8zCGGqX5FN2FSxG+WSGS3z+blmrg=";
  };

  format = "setuptools";

  nativeBuildInputs = [
    cython
    setuptools-scm
  ];

  # From: https://github.com/DataDog/dd-trace-py/blob/a21545212fdad941e3dae7eaf2a3acd03d60320d/setup.py#L45
  postPatch = ''
    ln -s ${libddwaf} ./ddtrace/appsec/ddwaf/libddwaf
  '';

  buildInputs = [
    libddwaf
    ddsketch
    packaging
    protobuf
    tenacity
    attrs
    cattrs
    six
    typing-extensions
    jsonschema
    xmltodict
    envier
    opentelemetry-api
    bytecode
  ];

  doCheck = false;

  meta = {
    description = "Datadog's tracing library for Python";
    homepage = "https://github.com/DataDog/dd-trace-py";
  };
}
