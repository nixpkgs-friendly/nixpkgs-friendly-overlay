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

        testslide = callPyPkg ./testslide { };

        torch-optimizer = callPyPkg ./torch-optimizer { };

        torchaudio = callPyPkg ./torchaudio { };

        # Remove after PR#228803 lands at nixos-unstable
        # https://github.com/NixOS/nixpkgs/pull/228803
        # https://nixpk.gs/pr-tracker.html?pr=228803
        wandb = python-prev.wandb.overrideAttrs(oa: {
          disabledTests = [ "test_artifacts_cache_cleanup" ];
        });

        webdriver-manager = callPyPkg ./webdriver-manager { };

        xformers = callPyPkg ./xformers { };
      }
    )
  ];
}
