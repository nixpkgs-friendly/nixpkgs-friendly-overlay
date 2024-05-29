{
  pkgs,
  vscode-utils,
  lib,
  bicep-lsp,
  #gnused,
  ...
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    publisher = "ms-azuretools";
    name = "vscode-bicep";
    version = "0.27.1";
    hash = "sha256-ERPqYb/dGoH8DD+tRFgDcwmxuIgErA8+0cX+/6r7CtU=";
  };

  #buildNativeInputs = [ gnused ];

  #postPatch = ''
  #  echo "postPatch for bscode-bicep"
  #  sed -i package.json -e 's/"ms-dotnettools.vscode-dotnet-runtime"//'
  #'';

  buildInputs = with pkgs; [
    dotnetCorePackages.runtime_8_0
    dotnetCorePackages.sdk_8_0
    azure-cli
    bicep
    bicep-lsp
  ];

  meta.downloadPage = "https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep";
}

# https://rakhesh.com/azure/bicep-stuck-on-registering-commands-in-vs-code/
# Bicep language server is missing


### Needs to symlink to .net:
# /home/intj/.config/VSCodium/User/globalStorage/ms-dotnettools.vscode-dotnet-runtime/.dotnet/8.0.5~x64/
