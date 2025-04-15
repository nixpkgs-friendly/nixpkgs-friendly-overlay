final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
  extensionFromVscodeMarketplace = final.vscode-utils.extensionFromVscodeMarketplace;
in

{
  vscode-extensions = prev.vscode-extensions // {

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

    npruehs.pony = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=npruehs.pony
      publisher = "npruehs";
      name = "pony";
      version = "0.0.4";
      hash = "sha256-iAs5YnaO8+GdPrcXupRVy80O45P23F2yRdXP2Dj7F3Y=";
    }) (prev.vscode-extensions.npruehs.pony or null);

    philhindle.errorlens = pickLatest (extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=PhilHindle.errorlens
      publisher = "PhilHindle";
      name = "errorlens";
      version = "1.1.3";
      hash = "sha256-kMbet43DvTGIui7fcP8amCVzS0C/KY9VBVlZ+MlTxyM=";
    }) (prev.vscode-extensions.philhindle.errorlens or null);

  };
}
