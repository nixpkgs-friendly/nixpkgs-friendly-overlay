final: prev:

let
  callPackage = final.callPackage;
in
rec {
  godot_4 = callPackage ./godot/4 { };

}
