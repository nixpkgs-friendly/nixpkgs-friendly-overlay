{ vimUtils, fetchFromGitHub, ... }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "vim-taste";
  version = "2020-02-17";

  src = fetchFromGitHub {
    owner = "jordwalke";
    repo = "vim-taste";
    rev = "3d2990876be923856b539d509a8d83d2ca447760";
    hash = "sha256-8RpNu1uFab4HR3tw8Vxv/wnsp2yhu3v8SuNLUsCM4rs=";
  };

  meta.homepage = "https://github.com/jordwalke/vim-taste";
}

