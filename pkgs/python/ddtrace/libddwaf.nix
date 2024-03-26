{ stdenv, fetchurl, autoPatchelfHook, ... }:

stdenv.mkDerivation rec {
  pname = "libddwaf";
  version = "1.9.0";

  src = fetchurl {
    url =
      "https://github.com/DataDog/libddwaf/releases/download/1.9.0/libddwaf-1.9.0-linux-x86_64.tar.gz";
    hash = "sha256-oedCIRbTGIg61DlC10Frvj6SeX5ghAM2qY0RAEh96RI=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  installPhase = ''
    runHook preInstall
    mkdir $out
    cp -a * $out/
    runHook postInstall
  '';
}
