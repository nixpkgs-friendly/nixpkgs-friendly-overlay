final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev:
      let
        fetchpatch2 = prev.fetchpatch2;
        callPyPkg = python-final.callPackage;
      in
      {
        abstract-singleton = callPyPkg ./abstract-singleton { };

        auto-gpt-plugin-template = callPyPkg ./auto-gpt-plugin-template { };

        composer = callPyPkg ./composer { };

        coolname = callPyPkg ./coolname { };

        databases = callPyPkg ./databases { };

        ddsketch = callPyPkg ./ddsketch { };

        ddtrace = callPyPkg ./ddtrace { };

        envier = callPyPkg ./envier { };

        flake8-quotes = callPyPkg ./flake8-quotes { };

        loralib = callPyPkg ./loralib { };

        ml-dtypes = callPyPkg ./ml-dtypes { };

        openapi-python-client = callPyPkg ./openapi-python-client { };

        pyre-check = callPyPkg ./pyre-check { };

        pyre-extensions = callPyPkg ./pyre-extensions { };

        pytorch-ranger = callPyPkg ./pytorch-ranger { };

        scikit-optimize = python-prev.scikit-optimize.overrideAttrs (oa: {
          patches = [
            # https://github.com/scikit-optimize/scikit-optimize/pull/1166
            (fetchpatch2 {
              url = "https://github.com/scikit-optimize/scikit-optimize/pull/1166.patch";
              hash = "sha256-YCxA0IQIFOJ1nZ741lGIcGsFM08HMz80mb3OalGgM/M";
            })
            # https://github.com/scikit-optimize/scikit-optimize/pull/1150
            (fetchpatch2 {
              url = "https://github.com/scikit-optimize/scikit-optimize/pull/1150.patch";
              hash = "sha256-4OL8rIkq5jYn2X7q8RsyyPXPqUvSxFqHcZ/zoiQR/SU=";
            })
          ];
        });

        sourcery = callPyPkg ./sourcery { };

        # tensorboard = callPyPkg ./tensorboard { };

        # tensorboard-data-server = callPyPkg ./tensorboard-data-server { };

        testslide = callPyPkg ./testslide { };

        # torch = callPyPkg ./torch {
        #   cudaSupport = python-prev.config.cudaSupport or false;
        #   inherit (python-prev.pkgs.darwin.apple_sdk.frameworks) Accelerate CoreServices;
        #   inherit (python-prev.pkgs.darwin) libobjc;
        #   inherit (python-prev.pkgs.llvmPackages_rocm) openmp;
        # };

        torch-optimizer = callPyPkg ./torch-optimizer { };

        torchaudio = callPyPkg ./torchaudio { };

        webdriver-manager = callPyPkg ./webdriver-manager { };

        xformers = callPyPkg ./xformers { };
      }
    )
  ];
}
