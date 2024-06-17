{
  lib,
  stdenv,
}:

{
  meta ? { },
  pname,
  src,
  version,
}:

let meta' = meta; in

stdenv.mkDerivation rec {
  inherit pname version src;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/plugins/${pname}
    cp -r ./ $out/plugins/${pname}

    touch $out/plugins/${pname}/git-rev
    echo "${src.rev}" > $out/plugins/${pname}/git-rev

    runHook postInstall
  '';

  meta = {
    description = "";
    downloadPage = "";
    homepage = "";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  } // meta';
}
