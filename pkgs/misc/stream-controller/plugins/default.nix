{
  symlinkJoin,
  makeWrapper,
  stream-controller,
}:
plugins:

let
  self = symlinkJoin {
    name = "${stream-controller.name}-with-plugins";
    paths = [ stream-controller ] ++ plugins;

    nativeBuildInputs = [ makeWrapper ];
    postBuild = ''
      wrapProgram "$out/bin/StreamController" \
        --set-default PLUGIN_DIR "$out/plugins"
    '';

    meta = stream-controller.meta // {
      longDescription = ''
        ${stream-controller.meta.description}
        With plugins added
      '';
    };
  };
in
self
