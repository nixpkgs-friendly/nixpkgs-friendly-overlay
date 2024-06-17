final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  firefox-extensions = callPackage ./firefox-extensions { };

  stream-controller = callPackage ./stream-controller { };

  stream-controller-with-plugins = (callPackage ./stream-controller/plugins { }) { plugins = with final.stream-controller-plugins; [
    audioControl
    audioSwitcher
    battery
    clocks
    counter
    deckPlugin
    mediaPlugin
    micMute
    obsPlugin
    osPlugin
    requests
    speedTest
    volumeMixer
  ];};

  stream-controller-plugins = {
    audioControl = callPackage ./stream-controller/plugins/audio-control { };
    audioSwitcher = callPackage ./stream-controller/plugins/audio-switcher { };
    battery = callPackage ./stream-controller/plugins/battery { };
    clocks = callPackage ./stream-controller/plugins/clocks { };
    counter = callPackage ./stream-controller/plugins/counter { };
    deckPlugin = callPackage ./stream-controller/plugins/deck-plugin { };
    mkPlugin = callPackage ./stream-controller/plugins/generic.nix { };
    mediaPlugin = callPackage ./stream-controller/plugins/media-plugin { };
    micMute = callPackage ./stream-controller/plugins/mic-mute { };
    obsPlugin = callPackage ./stream-controller/plugins/obs-plugin { };
    osPlugin = callPackage ./stream-controller/plugins/os-plugin { };
    requests = callPackage ./stream-controller/plugins/requests { };
    speedTest = callPackage ./stream-controller/plugins/speed-test { };
    volumeMixer = callPackage ./stream-controller/plugins/volume-mixer { };
  };

  vimPlugins = import ./vim-plugins/default.nix final prev;
}
