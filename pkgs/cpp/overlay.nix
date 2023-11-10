final: prev:

let
  callPackage = final.callPackage;
in
rec {
  godot_4 = callPackage ./godot/4 { };
  godot_4-debug = godot_4.override({ withDebug = true; });
  godot_4-export-templates = callPackage ./godot/4/export-templates.nix { };

  godot_4_2_beta5 = godot_4.overrideAttrs(oa: {
    version = "4.2-beta5";
    src = final.fetchFromGitHub {
      owner = "godotengine";
      repo = "godot";
      # Hash from: https://github.com/godotengine/godot-builds/releases/tag/4.2-beta5
      rev = "4c96e9676b66d0cc9a25022b019b78f4c20ddc60";
      hash = "sha256-3dwkZINT9DihUIScVLXDFONMEy7mAaoikW0GDNiskgM=";
    };
    GODOT_VERSION_STATUS="beta5";
  });
  godot_4_2_beta5-debug = godot_4_2_beta5.override({ withDebug = true; });
  godot_4_2_beta5-export-templates = final.fetchzip {
    url = "https://github.com/godotengine/godot-builds/releases/download/4.2-beta5/Godot_v4.2-beta5_export_templates.tpz";
    hash = "sha256-JoZ5xzVaaVScbthE79KRB6EDtrTKLHbKSUbh6ZrNhlk=";
    name = "godot-export-templates";
    extension = "zip";
  };

}
