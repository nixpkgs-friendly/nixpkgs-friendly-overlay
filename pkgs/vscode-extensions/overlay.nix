final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  vscode-extensions = prev.vscode-extensions // {
    ms-azuretools.vscode-bicep = callPackage ./ms-azuretools.vscode-bicep { };
  };
}

#x = pickLatest (callPackage ./x { }) (prev.x or null);
