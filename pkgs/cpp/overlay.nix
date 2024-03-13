final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
in

rec {
  godot_4_2_2-rc2 =
    let
      commit = "c61a68614e5b030a4a1e11abaa5a893b8017f78d";
    in
    prev.godot_4.overrideAttrs(oa: rec {
      GODOT_VERSION_STATUS = "rc2";
      version = "4.2.2-${GODOT_VERSION_STATUS}";
      src = final.fetchFromGitHub {
        owner = "godotengine";
        repo = "godot";
        rev = commit;
        hash = "sha256-bqEy5bB9YpeYgRxO81LUj/UG/uyNEcii9VECzfZeppo=";
      };
      preConfigure = ''
        mkdir -p .git
        echo ${commit} > .git/HEAD
      '';
    });
  godot_4 = godot_4_2_2-rc2;

  godot_4_2_2-rc2-export-templates = prev.fetchzip {
    pname = "export_templates";
    extension = "zip";
    url = "https://github.com/godotengine/godot-builds/releases/download/4.2.2-rc2/Godot_v4.2.2-rc2_export_templates.tpz";
    hash = "sha256-Cb5s2u3zCEKqKqBDbt5T8ONXPosuDsrT1SCtaZX/Zfk=";
  };
  godot_4-export-templates = godot_4_2_2-rc2-export-templates;
  # godot_4-export-templates = callPackage ./godot/4/export-templates.nix { };

}
