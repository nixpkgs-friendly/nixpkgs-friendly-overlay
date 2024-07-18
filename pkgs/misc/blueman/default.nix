prev: final:

prev.blueman.overrideAttrs (oldAttrs: rec {
  src = prev.fetchurl {
    url = "https://github.com/blueman-project/blueman/releases/download/2.3.5/blueman-2.3.5.tar.xz";
    hash = "sha256-stIa/fd6Bs2G2vVAJAb30qU0WYF+KeC+vEkR1PDc/aE=";
  };
})
