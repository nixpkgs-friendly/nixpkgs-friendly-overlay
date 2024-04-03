{
  pkgs,
  stdenv,
  cmake,
  fetchFromGitHub,
  git,
  libinjection,
  # , libutf8proc
  rapidjson,
  callPackage,
  autoPatchelfHook,
  fetchurl,
  ...
}:

# let
#   libutf8proc = callPackage ../../../applications/networking/browsers/netsurf/libutf8proc.nix;
# in

stdenv.mkDerivation rec {
  pname = "libddwaf";
  version = "1.9.0";

  # src = fetchFromGitHub {
  #   owner = "DataDog";
  #   repo = "libddwaf";
  #   rev = "${version}";
  #   hash = "sha256-tuhQ1DX7NtwDdI/jvw3O9M5Eyenc9FKTROMf1kK97fI=";
  #   leaveDotGit = true;
  #   fetchSubmodules = true;
  # };

  # cmakeFlags = [
  #   "-DDDWAF_VERSION=\"${version}\""
  # ];

  nativeBuildInputs = [ autoPatchelfHook ];
  # nativeBuildInputs = [ cmake git ];

  # lib_re2 lib_rapidjson lib_ac lib_injection lib_radix lib_utf8proc

  # buildInputs = [
  #   # libinjection
  #   # libutf8proc
  #   # rapidjson
  # ];

  # GIT_DISCOVERY_ACROSS_FILESYSTEM="1";

  installPhase = ''
    runHook preInstall
    mkdir $out
    cp -a * $out/

    runHook postInstall
  '';
}
