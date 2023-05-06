final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev:
      let callPyPkg = python-final.callPackage; in
      {
        abstract-singleton = callPyPkg ./abstract-singleton { };
        auto-gpt-plugin-template = callPyPkg ./auto-gpt-plugin-template { };
        pybrowsers = callPyPkg ./pybrowsers { };
        sourcery = callPyPkg ./sourcery { };
        webdriver-manager = callPyPkg ./webdriver-manager { };
      }
    )
  ];
}
