{ vimUtils, fetchFromGitHub, ... }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "vim-pairtools";
  version = "1.5.2-unstable-2012-05-08";

  src = fetchFromGitHub {
    owner = "MartinLafreniere";
    repo = "vim-PairTools";
    rev = "6092a0afc3b56f73b12576845d9b8b68278e954e";
    hash = "sha256-z/+qv6KEBtwBuo5FSxTNNsONhAQtcEOZHZnR3mjV5fM=";
  };

  meta.homepage = "https://github.com/MartinLafreniere/vim-PairTools";
}
