{ fetchzip
, godot_4
}:

let
  godot-export-templates-versions = {
    "4.1.1" = fetchzip {
      url = "https://github.com/godotengine/godot/releases/download/4.1.1-stable/Godot_v4.1.1-stable_export_templates.tpz";
      hash = "sha256-J2TjDvduHqB5LgTH3n3XV4/gIavnvu4ZB666DLEEuSg=";
      name = "godot-export-templates";
      extension = "zip";
    };
    "4.1.1-stable" = fetchzip {
      url = "https://github.com/godotengine/godot/releases/download/4.1.1-stable/Godot_v4.1.1-stable_export_templates.tpz";
      hash = "sha256-J2TjDvduHqB5LgTH3n3XV4/gIavnvu4ZB666DLEEuSg=";
      name = "godot-export-templates";
      extension = "zip";
    };
    "4.1.2-stable" = fetchzip {
      url = "https://github.com/godotengine/godot/releases/download/4.1.2-stable/Godot_v4.1.2-stable_export_templates.tpz";
      hash = "sha256-jItuAlhqneMGIw+qnYDMAJrxTYy/ET2vy9XXcKji0Q0=";
      name = "godot-export-templates";
      extension = "zip";
    };
    "4.1.3-stable" = fetchzip {
      url = "https://github.com/godotengine/godot/releases/download/4.1.3-stable/Godot_v4.1.3-stable_export_templates.tpz";
      hash = "sha256-P3CkOyR+IT/KDuV6WpL8yOd97jOTYuRGGhLo4ObsDvM=";
      name = "godot-export-templates";
      extension = "zip";
    };
  };
in
  godot-export-templates-versions.${godot_4.version}
