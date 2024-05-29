final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  vscode-extensions = prev.vscode-extensions // {
    #x = pickLatest (callPackage ./x { }) (prev.x or null);
  };
}
