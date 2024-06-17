final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  firefox-extensions = callPackage ./firefox-extensions { };

  stream-controller = callPackage ./stream-controller { };

  stream-controller-with-plugins = (callPackage ./stream-controller/plugins { }) { plugins = with final.stream-controller-plugins; [
    counter
    deckPlugin
    mediaPlugin
    obsPlugin
    osPlugin
  ];};

  stream-controller-plugins = {
    counter = callPackage ./stream-controller/plugins/counter { };
    deckPlugin = callPackage ./stream-controller/plugins/deck-plugin { };
    mkPlugin = callPackage ./stream-controller/plugins/generic.nix { };
    mediaPlugin = callPackage ./stream-controller/plugins/media-plugin { };
    obsPlugin = callPackage ./stream-controller/plugins/obs-plugin { };
    osPlugin = callPackage ./stream-controller/plugins/os-plugin { };
  };

  vimPlugins = import ./vim-plugins/default.nix final prev;
}
