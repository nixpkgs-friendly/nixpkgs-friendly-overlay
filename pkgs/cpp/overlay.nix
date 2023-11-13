final: prev:

let
  callPackage = final.callPackage;
in

rec {
  godot_4 = callPackage ./godot/4 { };
  godot_4-debug = godot_4.override({ withDebug = true; });
  godot_4-export-templates = callPackage ./godot/4/export-templates.nix { };

  godot_4_2_beta6 =
    let commitHash = "64150060f89677eaf11229813ae6c5cf8a873802"; in
    godot_4.overrideAttrs(oa: {
      version = "4.2-beta6";
      src = final.fetchFromGitHub {
        owner = "godotengine";
        repo = "godot";
        # Hash from: https://github.com/godotengine/godot-builds/releases/tag/4.2-beta6
        rev = commitHash;
        hash = "sha256-Q7OmQIbvHx+Re4vlov4ylmWzhWJL4GWzr2AYkSk0fiQ=";
      };
      GODOT_VERSION_STATUS="beta6";
      preConfigure = ''
        mkdir -p .git
        echo ${commitHash} > .git/HEAD
      '';
    });
  godot_4_2_beta6-debug = godot_4_2_beta6.override({ withDebug = true; });
  godot_4_2_beta6-export-templates = final.fetchzip {
    url = "https://github.com/godotengine/godot-builds/releases/download/4.2-beta6/Godot_v4.2-beta6_export_templates.tpz";
    hash = "sha256-3Qi6lIHIvJ8DMDL8AdmOa/xasphnCYGoGIdNjXHZH2o=";
    name = "godot-export-templates";
    extension = "zip";
  };

  godot_4_2_beta5 =
    let commitHash = "4c96e9676b66d0cc9a25022b019b78f4c20ddc60"; in
    godot_4.overrideAttrs(oa: {
      version = "4.2-beta5";
      src = final.fetchFromGitHub {
        owner = "godotengine";
        repo = "godot";
        # Hash from: https://github.com/godotengine/godot-builds/releases/tag/4.2-beta5
        rev = commitHash;
        hash = "sha256-3dwkZINT9DihUIScVLXDFONMEy7mAaoikW0GDNiskgM=";
      };
      GODOT_VERSION_STATUS="beta5";
      preConfigure = ''
        mkdir -p .git
        echo ${commitHash} > .git/HEAD
      '';
    });
  godot_4_2_beta5-debug = godot_4_2_beta5.override({ withDebug = true; });
  godot_4_2_beta5-export-templates = final.fetchzip {
    url = "https://github.com/godotengine/godot-builds/releases/download/4.2-beta5/Godot_v4.2-beta5_export_templates.tpz";
    hash = "sha256-JoZ5xzVaaVScbthE79KRB6EDtrTKLHbKSUbh6ZrNhlk=";
    name = "godot-export-templates";
    extension = "zip";
  };

  godot_4_1_3_stable =
    let commitHash = "fc79201851a16215f9554884aa242ed957801b10"; in
      godot_4.overrideAttrs(oa: {
        version = "4.1.3-stable";
        src = final.fetchFromGitHub {
          owner = "godotengine";
          repo = "godot";
          rev = commitHash;
          hash = "sha256-z5JRPhdEO20AodS12MApgur0BMHGToUjo2r2eI77nNc=";
        };
        preConfigure = ''
          mkdir -p .git
          echo ${commitHash} > .git/HEAD
        '';
      });
  godot_4_1_3_stable-debug = godot_4_1_3_stable.override({ withDebug = true; });
  godot_4_1_3_stable-export-templates = final.fetchzip {
    url = "https://github.com/godotengine/godot/releases/download/4.1.3-stable/Godot_v4.1.3-stable_export_templates.tpz";
    hash = "sha256-P3CkOyR+IT/KDuV6WpL8yOd97jOTYuRGGhLo4ObsDvM=";
    name = "godot-export-templates";
    extension = "zip";
  };

  godot_4_master =
    let
      commitHash = "bdd9034ad05e1824ff5d9c750acd87caeafe6dca";
      shortHash = builtins.substring 0 7 commitHash;
    in
    godot_4.overrideAttrs(oa: {
      version = "4.2-master-${shortHash}";
      src = final.fetchFromGitHub {
        owner = "godotengine";
        repo = "godot";
        # Hash from: https://github.com/godotengine/godot/commits/master
        rev = commitHash;
        hash = "sha256-zXjUVs0LbIeKlj+D+C0pPV8P6iN0+zrAF9Gen3LHzV0=";
      };
      GODOT_VERSION_STATUS="master-${shortHash}";
      preConfigure = ''
        mkdir -p .git
        echo ${commitHash} > .git/HEAD
      '';
    });
  godot_4_master-debug = godot_4_master.override({ withDebug = true; });
  godot_4_master-export-templates = godot_4_2_beta5-export-templates; # Fix-Me

}
