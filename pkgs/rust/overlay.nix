final: prev:

let
  callPackage = final.callPackage;
  # pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in
{
  kcl-language-server = callPackage ./kcl-language-server { };
}

# x = pickLatest (callPackage ./x { }) (prev.x or null);
