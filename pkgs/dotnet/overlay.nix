final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  # bicep-lsp = callPackage ./bicep-lsp { };
}
