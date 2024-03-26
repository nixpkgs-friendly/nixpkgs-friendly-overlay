final: prev:

{
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev:
      let
        fetchpatch2 = prev.fetchpatch2;
        callPyPkg = python-final.callPackage;
        pickLatest = (import ../../utils.nix).pickLatest;
      in {
        abstract-singleton = pickLatest (callPyPkg ./abstract-singleton { })
          (python-prev.abstract-singleton or null);

        auto-gpt-plugin-template =
          pickLatest (callPyPkg ./auto-gpt-plugin-template { })
          (python-prev.auto-gpt-plugin-template or null);

        composer =
          pickLatest (callPyPkg ./composer { }) (python-prev.composer or null);

        coolname =
          pickLatest (callPyPkg ./coolname { }) (python-prev.coolname or null);

        ddsketch =
          pickLatest (callPyPkg ./ddsketch { }) (python-prev.ddsketch or null);

        ddtrace =
          pickLatest (callPyPkg ./ddtrace { }) (python-prev.ddtrace or null);

        dspy-ai =
          pickLatest (callPyPkg ./dspy-ai { }) (python-prev.dspy-ai or null);

        envier = pickLatest (callPyPkg ./envier { })
          (python-prev.envier or null); # Needs upstream

        flake8-quotes = pickLatest (callPyPkg ./flake8-quotes { })
          (python-prev.flake8-quotes or null);

        loralib =
          pickLatest (callPyPkg ./loralib { }) (python-prev.loralib or null);

        openapi-python-client =
          pickLatest (callPyPkg ./openapi-python-client { })
          (python-prev.openapi-python-client or null);

        pyre-check = pickLatest (callPyPkg ./pyre-check { })
          (python-prev.pyre-check or null);

        pytorch-ranger = pickLatest (callPyPkg ./pytorch-ranger { })
          (python-prev.pytorch-ranger or null);

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

        sourcery =
          pickLatest (callPyPkg ./sourcery { }) (python-prev.sourcery or null);

        # tensorboard = callPyPkg ./tensorboard { };

        # tensorboard-data-server = callPyPkg ./tensorboard-data-server { };

        testslide = pickLatest (callPyPkg ./testslide { })
          (python-prev.testslide or null);

        # torch = callPyPkg ./torch {
        #   cudaSupport = python-prev.config.cudaSupport or false;
        #   inherit (python-prev.pkgs.darwin.apple_sdk.frameworks) Accelerate CoreServices;
        #   inherit (python-prev.pkgs.darwin) libobjc;
        #   inherit (python-prev.pkgs.llvmPackages_rocm) openmp;
        # };

        torch-optimizer = pickLatest (callPyPkg ./torch-optimizer { })
          (python-prev.torch-optimizer or null);

        # xformers may benefit from improvements from here.
        # xformers = pickLatest (callPyPkg ./xformers { }) (python-prev.xformers or null);
      })
  ];
}
