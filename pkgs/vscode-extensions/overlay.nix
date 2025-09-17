final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
  extensionFromVscodeMarketplace = final.vscode-utils.extensionFromVscodeMarketplace;
in

{
  vscode-extensions = prev.lib.recursiveUpdate prev.vscode-extensions {

    "498-00".cppformat = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=498-00.cppformat
      publisher = "498-00";
      name = "cppformat";
      version = "1.0.10";
      hash = "sha256-4mcWjmhw8+yB3anbWC2Lhc/QjUUHEOiMeghkqinyYHQ=";
    }) (prev.vscode-extensions."498-00".cppformat or null);

    andrew-butson.vscode-openai = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=AndrewButson.vscode-openai
      publisher = "AndrewButson";
      name = "vscode-openai";
      version = "1.6.17";
      hash = "sha256-nROvrAO34y9+SVb40+Day9LSKG0eJl0iU8pgQ9CuOko=";
    }) (prev.vscode-extensions.andrew-butson.vscode-openai or null);

    designliquido.designliquido-vscode = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=designliquido.designliquido-vscode
      publisher = "designliquido";
      name = "designliquido-vscode";
      version = "0.12.24";
      hash = "sha256-MiVRVsyhjjxnyUeqC3sWpL4QGbSyoM53gWoK4C+qdK4=";
    }) (prev.vscode-extensions.designliquido.designliquido-vscode or null);

    gbtb.ponylang = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=gbtb.ponylang
      publisher = "gbtb";
      name = "ponylang";
      version = "0.2.2";
      hash = "sha256-ypSEb4j9Gig0Cpo4cM5IoGMmKv1f9MLTfJCXBZAzg3M=";
    }) (prev.vscode-extensions.gbtb.ponylang or null);

    jeff-hykin.better-cpp-syntax = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=jeff-hykin.better-cpp-syntax
      publisher = "jeff-hykin";
      name = "better-cpp-syntax";
      version = "1.27.1";
      hash = "sha256-GO/ooq50KLFsiEuimqTbD/mauQYcD/p2keHYo/6L9gw=";
    }) (prev.vscode-extensions.jeff-hykin.better-cpp-syntax or null);

    kcl.kcl-vscode-extension = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=kcl.kcl-vscode-extension
      publisher = "kcl";
      name = "kcl-vscode-extension";
      version = "0.2.2";
      hash = "sha256-iMRIe9IoVebu4KwIYw/558FPBL/NdDNDUy1le1luif8=";
      # Requires: kcl kcl-language-server
    }) (prev.vscode-extensions.kcl.kcl-vscode-extension or null);

    kreativ-software.csharpextensions = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=kreativ-software.csharpextensions
      publisher = "kreativ-software";
      name = "csharpextensions";
      version = "1.7.3";
      hash = "sha256-qv2BbcT07cogjlLVFOKj0masRRU28krbQ5LWcFrcgQw=";
    }) (prev.vscode-extensions.kreativ-software.csharpextensions or null);

    ms-vscode.cpptools-themes = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-themes
      publisher = "ms-vscode";
      name = "cpptools-themes";
      version = "2.0.0";
      hash = "sha256-YWA5UsA+cgvI66uB9d9smwghmsqf3vZPFNpSCK+DJxc=";
    }) (prev.vscode-extensions.ms-vscode.cpptools-themes or null);

    npruehs.pony = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=npruehs.pony
      publisher = "npruehs";
      name = "pony";
      version = "0.0.4";
      hash = "sha256-iAs5YnaO8+GdPrcXupRVy80O45P23F2yRdXP2Dj7F3Y=";
    }) (prev.vscode-extensions.npruehs.pony or null);

    pflannery.vscode-versionlens = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens
      publisher = "pflannery";
      name = "vscode-versionlens";
      version = "1.22.3";
      hash = "sha256-+975OorwHN2/DJpjO6ECp+tRBAyDjEFkpaT3eb7ibBM=";
    }) (prev.vscode-extensions.pflannery.vscode-versionlens or null);

    philhindle.errorlens = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=PhilHindle.errorlens
      publisher = "PhilHindle";
      name = "errorlens";
      version = "1.1.3";
      hash = "sha256-kMbet43DvTGIui7fcP8amCVzS0C/KY9VBVlZ+MlTxyM=";
    }) (prev.vscode-extensions.philhindle.errorlens or null);

    vytautassurvila.csharp-ls = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=vytautassurvila.csharp-ls
      publisher = "vytautassurvila";
      name = "csharp-ls";
      version = "0.0.27";
      hash = "sha256-kl6W1UQ36cNQNj3cOsMyZbxD6glaRm3W0Z1W+xuEcjs=";
    }) (prev.vscode-extensions.vytautassurvila.csharp-ls or null);

  };
}
