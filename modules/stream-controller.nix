{ config, lib, pkgs, ... }:

let
  cfg = config.programs.stream-controller;

  streamController = pkgs.wrapped-stream-controller.override { stream-controller = cfg.package; } { inherit (pkgs) plugins; };
in
{
  options.programs.stream-controller = {
    enable = lib.mkEnableOption "stream-controller";

    autoStart = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Whether StreamController should be started automatically.";
    };

    package = lib.mkPackageOption pkgs "stream-controller" {
      default = [ "stream-controller" ];
    };

    plugins = lib.mkOption {
      default = [];
      description = "List of plugins to add";
    }
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      streamController
      (lib.mkIf cfg.autoStart (pkgs.makeAutostartItem { name = "StreamController"; package = streamController; }))
    ];

    services.udev.packages = [ cfg.package ];
  };

  meta.maintainers = with lib.maintainers; [ ];
}
