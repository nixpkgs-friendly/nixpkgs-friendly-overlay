final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev:
      let callPyPkg = python-final.callPackage; in
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

        openapi-python-client = callPyPkg ./openapi-python-client { };

        opentelemetry-api = callPyPkg ./opentelemetry-api { };

        pyre-check = callPyPkg ./pyre-check { };

        pyre-extensions = callPyPkg ./pyre-extensions { };

        pytorch-ranger = callPyPkg ./pytorch-ranger { };

        sourcery = callPyPkg ./sourcery { };

        tensorboard = callPyPkg ./tensorboard { };

        tensorboard-data-server = callPyPkg ./tensorboard-data-server { };

        testslide = callPyPkg ./testslide { };

        torch = callPyPkg ./torch {
          cudaSupport = python-prev.config.cudaSupport or false;
          inherit (python-prev.pkgs.darwin.apple_sdk.frameworks) Accelerate CoreServices;
          inherit (python-prev.pkgs.darwin) libobjc;
          inherit (python-prev.pkgs.llvmPackages_rocm) openmp;
        };

        torch-optimizer = callPyPkg ./torch-optimizer { };

        torchaudio = callPyPkg ./torchaudio { };

        wandb = callPyPkg ./wandb { };

        webdriver-manager = callPyPkg ./webdriver-manager { };

        xformers = callPyPkg ./xformers { };
      }
    )
  ];
}
