final: prev:

let
  callPackage = final.callPackage;
in
rec {
  godot_4 = callPackage ./godot/4 { };
  godot_4-export-templates = callPackage ./godot/4/godot-export-templates.nix { };
}
