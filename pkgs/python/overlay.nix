final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev:
      let callPyPkg = python-final.callPackage; in
      {
        abstract-singleton = callPyPkg ./abstract-singleton { };
        auto-gpt-plugin-template = callPyPkg ./auto-gpt-plugin-template { };
        composer = callPyPkg ./composer { };
        coolname = callPyPkg ./coolname { };
        flake8-quotes = callPyPkg ./flake8-quotes { };
        openapi-python-client = callPyPkg ./openapi-python-client { };
        pytorch-ranger = callPyPkg ./pytorch-ranger { };
        sourcery = callPyPkg ./sourcery { };
        torch-optimizer = callPyPkg ./torch-optimizer { };
        wandb = python-prev.wandb.overrideAttrs(oa: { disabledTests = [ "test_artifacts_cache_cleanup" ]; });
        webdriver-manager = callPyPkg ./webdriver-manager { };
      }
    )
  ];
}
