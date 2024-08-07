{
  azure-cli,
  bicep,
  bicep-lsp,
  #gnused,
  lib,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    publisher = "ms-azuretools";
    name = "vscode-bicep";
    version = "0.29.47";
    hash = "sha256-HXxJsaYfO4ba73KaVeC8JKguYS7oHtY9e0U/0rb694s=";
  };

  #buildNativeInputs = [ gnused ];

  #postPatch = ''
  #  echo "postPatch for bscode-bicep"
  #  sed -i package.json -e 's/"ms-dotnettools.vscode-dotnet-runtime"//'
  #'';

  buildInputs = with pkgs; [
    # dotnetCorePackages.runtime_8_0
    # dotnetCorePackages.sdk_8_0
    azure-cli
    bicep
    bicep-lsp
  ];

  meta = {
    description = "Visual Studio Code extension for Bicep language";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep";
    homepage = "https://github.com/Azure/bicep/tree/main/src/vscode-bicep";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ] ++ lib.teams.stridtech.members;
  };
}

# From: https://github.com/Azure/bicep/blob/main/src/vscode-bicep/package.json#L818
# Extension dependencies:
#   - ms-dotnettools.vscode-dotnet-runtime
#     https://github.com/dotnet/vscode-dotnet-runtime/blob/main/vscode-dotnet-runtime-extension/package.json#L83C6-L83C57

# https://rakhesh.com/azure/bicep-stuck-on-registering-commands-in-vs-code/
# Bicep language server is missing


### Needs to symlink to .net:
# /home/intj/.config/VSCodium/User/globalStorage/ms-dotnettools.vscode-dotnet-runtime/.dotnet/8.0.5~x64/
