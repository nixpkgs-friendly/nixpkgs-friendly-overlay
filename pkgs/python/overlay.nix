final: prev:

{
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (
      python-final: python-prev:
      let
        fetchpatch2 = prev.fetchpatch2;
        callPyPkg = python-final.callPackage;
        pickLatest = (import ../../utils.nix).pickLatest;
      in
      {
        # abstract-singleton = pickLatest (callPyPkg ./abstract-singleton { }) (
        #   python-prev.abstract-singleton or null
        # );

        # auto-gpt-plugin-template = pickLatest (callPyPkg ./auto-gpt-plugin-template { }) (
        #   python-prev.auto-gpt-plugin-template or null
        # );

        # composer = pickLatest (callPyPkg ./composer { }) (python-prev.composer or null);

        # ddsketch = pickLatest (callPyPkg ./ddsketch { }) (python-prev.ddsketch or null);

        # ddtrace = pickLatest (callPyPkg ./ddtrace { }) (python-prev.ddtrace or null);

        # dspy-ai = pickLatest (callPyPkg ./dspy-ai { }) (python-prev.dspy-ai or null);

        # envier = pickLatest (callPyPkg ./envier { }) (python-prev.envier or null); # Needs upstream

        # loralib = pickLatest (callPyPkg ./loralib { }) (python-prev.loralib or null);

        # obs-websocket-py = pickLatest (callPyPkg ./obs-websocket-py { }) (python-prev.obs-websocket-py or null);

        prusalinkpy = pickLatest (callPyPkg ./prusalinkpy { }) (python-prev.prusalinkpy or null);

        # pyre-check = pickLatest (callPyPkg ./pyre-check { }) (python-prev.pyre-check or null);

        # Drop when StreamController uses the new levenshtein package
        python-levenshtein = python-prev.levenshtein.overrideAttrs (o: rec {
          pname = "python-Levenshtein";

          src = prev.fetchFromGitHub {
            owner = "rapidfuzz";
            repo = pname;
            rev = "refs/tags/v${o.version}";
            hash = "sha256-GBpYxwLdEuxnkxXTdTLv0ezmVtB4uLjMeTcEP8gMNNA=";
            fetchSubmodules = true; # # for vendored `rapidfuzz-cpp`
          };

          pythonImportsCheck = [ pname ];
        });

        # pytorch-ranger = pickLatest (callPyPkg ./pytorch-ranger { }) (python-prev.pytorch-ranger or null);

        # scikit-optimize = python-prev.scikit-optimize.overrideAttrs (oa: {
        #   patches = [
        #     # https://github.com/scikit-optimize/scikit-optimize/pull/1166
        #     (fetchpatch2 {
        #       url = "https://github.com/scikit-optimize/scikit-optimize/pull/1166.patch";
        #       hash = "sha256-YCxA0IQIFOJ1nZ741lGIcGsFM08HMz80mb3OalGgM/M";
        #     })
        #     # https://github.com/scikit-optimize/scikit-optimize/pull/1150
        #     (fetchpatch2 {
        #       url = "https://github.com/scikit-optimize/scikit-optimize/pull/1150.patch";
        #       hash = "sha256-4OL8rIkq5jYn2X7q8RsyyPXPqUvSxFqHcZ/zoiQR/SU=";
        #     })
        #   ];
        # });

        streamcontroller-plugin-tools = pickLatest (callPyPkg ./streamcontroller-plugin-tools { }) (python-prev.streamcontroller-plugin-tools or null);

        # testslide = pickLatest (callPyPkg ./testslide { }) (python-prev.testslide or null);

        # torch-optimizer = pickLatest (callPyPkg ./torch-optimizer { }) (
        #   python-prev.torch-optimizer or null
        # );

      }
    )
  ];
}
