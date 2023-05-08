final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev:
      let callPyPkg = python-final.callPackage; in
      {
        abstract-singleton = callPyPkg ./abstract-singleton { };
        auto-gpt-plugin-template = callPyPkg ./auto-gpt-plugin-template { };
        openapi-python-client = callPyPkg ./openapi-python-client { };
        sourcery = callPyPkg ./sourcery { };
        wandb = python-prev.wandb.overrideAttrs(oa: { disabledTests = [ "test_artifacts_cache_cleanup" ]; });
        webdriver-manager = callPyPkg ./webdriver-manager { };
      }
    )
  ];
}
