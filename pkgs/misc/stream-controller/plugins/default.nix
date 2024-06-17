{
  lib,
  makeWrapper,
  stream-controller,
  symlinkJoin,
}:

{
  plugins ? []
}:

symlinkJoin {
  name = "wrapped-${stream-controller.name}";

  nativeBuildInputs = [ makeWrapper ];
  paths = [ stream-controller ] ++ plugins;

  postBuild =
    let
      pluginsJoined = symlinkJoin {
        name = "stream-controller-plugins";
        paths = plugins;
      };

      wrapCommandLine = [
        "wrapProgram"
        "$out/bin/StreamController"
        ''--set PLUGIN_DIR "$out/plugins"''
      ];

    in ''
    ${lib.concatStringsSep " " wrapCommandLine}

    # Leave some breadcrumbs
    echo 'Plugins are at ${pluginsJoined}/plugins' > $out/plugins-README
  '';

  meta = stream-controller.meta // {
    longDescription = ''
      ${stream-controller.meta.description}
      With plugins added
    '';
    mainProgram = "StreamController";
  };
  passthru = stream-controller.passthru // {
    unwrapped = stream-controller;
  };
}
