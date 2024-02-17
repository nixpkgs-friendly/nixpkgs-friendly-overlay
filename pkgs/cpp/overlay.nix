final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in

{
  godot_4-export-templates = callPackage ./godot/4/export-templates.nix { };

}
