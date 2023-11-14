final: prev:

let
  callPackage = final.callPackage;

  self = (self:
    let generic = { majorMinorVersion, versionStatus, commit, hash, exportTemplatesHash }:
      let
        versionDerivation = majorMinorVersion + "-" + versionStatus;
        nameToplevel = "godot_" + (prev.lib.replaceStrings [ "." ] [ "_" ] majorMinorVersion) + "_" + versionStatus;
        # shortHash = builtins.substring 0 7 hash;
      in
      {
        "${nameToplevel}" =
          self.godot_4.overrideAttrs(oa: {
            version = versionDerivation;
            GODOT_VERSION_STATUS = versionStatus;
            src = final.fetchFromGitHub {
              owner = "godotengine";
              repo = "godot";
              # Hash from: https://github.com/godotengine/godot-builds/releases/tag/4.2-beta6
              rev = commit;
              hash = hash;
            };
            preConfigure = ''
              mkdir -p .git
              echo ${commit} > .git/HEAD
            '';
          });
        "${nameToplevel}-debug" = self."${nameToplevel}".override({ withDebug = true; });
        "${nameToplevel}-export-templates" = final.fetchzip {
          url = "https://github.com/godotengine/godot-builds/releases/download/" + versionDerivation + "/Godot_v" + versionDerivation + "_export_templates.tpz";
          hash = exportTemplatesHash;
          name = "godot-export-templates";
          extension = "zip";
        };
      }; # end of generic
    in
    (
      {
        godot_4 = callPackage ./godot/4 { };
        godot_4-debug = self.godot_4.override({ withDebug = true; });
        godot_4-export-templates = callPackage ./godot/4/export-templates.nix { };
      } // (generic({
          majorMinorVersion = "4.2";
          versionStatus = "beta6";
          commit = "64150060f89677eaf11229813ae6c5cf8a873802";
          hash = "sha256-Q7OmQIbvHx+Re4vlov4ylmWzhWJL4GWzr2AYkSk0fiQ=";
          exportTemplatesHash = "sha256-3Qi6lIHIvJ8DMDL8AdmOa/xasphnCYGoGIdNjXHZH2o=";
        }))
        // (generic({
          majorMinorVersion = "4.2";
          versionStatus = "beta5";
          commit = "4c96e9676b66d0cc9a25022b019b78f4c20ddc60";
          hash = "sha256-3dwkZINT9DihUIScVLXDFONMEy7mAaoikW0GDNiskgM=";
          exportTemplatesHash = "sha256-JoZ5xzVaaVScbthE79KRB6EDtrTKLHbKSUbh6ZrNhlk=";
        }))
        // (generic({
          majorMinorVersion = "4.1.3";
          versionStatus = "stable";
          commit = "fc79201851a16215f9554884aa242ed957801b10";
          hash = "sha256-z5JRPhdEO20AodS12MApgur0BMHGToUjo2r2eI77nNc=";
          exportTemplatesHash = "sha256-P3CkOyR+IT/KDuV6WpL8yOd97jOTYuRGGhLo4ObsDvM=";
        }))
        # // (generic({
        #   commit = "bdd9034ad05e1824ff5d9c750acd87caeafe6dca";
        #   majorMinorVersion = "4.2";
        #   versionStatus = "master";
        #   hash = "sha256-zXjUVs0LbIeKlj+D+C0pPV8P6iN0+zrAF9Gen3LHzV0=";
        #   # exportTemplatesHash = "";
        # }))
    )
  ) self; in self


#########

  # godot_4_master =
  #   let
  #     commitHash = "bdd9034ad05e1824ff5d9c750acd87caeafe6dca";
  #     shortHash = builtins.substring 0 7 commitHash;
  #   in
  #   godot_4.overrideAttrs(oa: {
  #     version = "4.2-master-${shortHash}";
  #     src = final.fetchFromGitHub {
  #       owner = "godotengine";
  #       repo = "godot";
  #       # Hash from: https://github.com/godotengine/godot/commits/master
  #       rev = commitHash;
  #       hash = "sha256-zXjUVs0LbIeKlj+D+C0pPV8P6iN0+zrAF9Gen3LHzV0=";
  #     };
  #     GODOT_VERSION_STATUS="master-${shortHash}";
  #     preConfigure = ''
  #       mkdir -p .git
  #       echo ${commitHash} > .git/HEAD
  #     '';
  #   });
  # godot_4_master-debug = godot_4_master.override({ withDebug = true; });
  # godot_4_master-export-templates = godot_4_2_beta5-export-templates; # Fix-Me
