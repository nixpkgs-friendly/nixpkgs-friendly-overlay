final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  firefox-extensions = callPackage ./firefox-extensions { };

  stream-controller = callPackage ./stream-controller { };

  stream-controller-with-plugins = (callPackage ./stream-controller/plugins { }) [ final.stream-controller-plugins.counter ];

  stream-controller-plugins = {
    counter = callPackage ./stream-controller/plugins/counter { };
  };

  vimPlugins = import ./vim-plugins/default.nix final prev;
}
