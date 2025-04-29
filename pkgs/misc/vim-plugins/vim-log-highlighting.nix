{ vimUtils, fetchFromGitHub, ... }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "vim-log-highlighting";
  version = "2020-08-30";

  src = fetchFromGitHub {
    owner = "MTDL9";
    repo = "vim-log-highlighting";
    rev = "1037e26f3120e6a6a2c0c33b14a84336dee2a78f";
    hash = "sha256-DqYSCtndUNIZsd9zpTFBhESXw3graNrjGC3WhcZ9uTA=";
  };

  meta.homepage = "https://github.com/MTDL9/vim-log-highlighting/";
}
