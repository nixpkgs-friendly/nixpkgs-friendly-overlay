{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.nakama;
  settingsFormat = pkgs.formats.yaml { };
in

{
  options.services.nakama = {

    enable = lib.mkEnableOption "Whether or not to enable Nakama service";

    package = lib.mkPackageOption pkgs "nakama" { };

    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Open Nakama ports in the firewall.
        Ports opened:
          - 7348/{tcp,udp} for GRPC API server for embedded developer console
          - 7349/{tcp,udp} for GRPC API server
          - 7350/{tcp,udp} for HTTP API server
          - 7351/{tcp,udp} for HTTP API server for embedded developer console
      '';
    };

    useLocalPostgres = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Will configure a local PostgreSQL service and bootstrap a Nakama database for use in Nakama
      '';
    };

    settings = lib.mkOption {
      default = { };
      description = ''
        Nakama configuration. Refer to <https://heroiclabs.com/docs/nakama/server-framework/server-configuration/>
        for details on supported values.
      '';
      example = lib.literalExpression ''
        {
          name = "nakama-node-1";
          data_dir = "/var/lib/nakama";
          database = {
            address = [ "nakama:nakama@localhost:5432" ];
          };
        }
      '';

      type = lib.types.submodule {
        freeformType = settingsFormat.type;

        options = {

          name = lib.mkOption {
            type = lib.types.str;
            default = "nakama-node-1";
            defaultText = "nakama-node-1";
            description = "Nakama node name (must be unique)";
          };

          data_dir = lib.mkOption {
            type = lib.types.path;
            default = "/var/lib/nakama";
            defaultText = "/var/lib/nakama";
            description = "Nakama data directory. An absolute path to a writeable folder where Nakama will store its data, including logs";
          };

          shutdown_grace_sec = lib.mkOption {
            type = lib.types.int;
            default = 10;
            defaultText = "10";
            description = "Maximum number of seconds to wait for the server to complete work before shutting down. If 0 the server will shut down immediately when it receives a termination signal";
          };

          database = {

            address = lib.mkOption {
              default = [ "nakama:nakama@localhost:5432" ];
              defaultText = ''[ "nakama:nakama@localhost:5432" ]'';
              type = lib.types.listOf lib.types.str;
              description = "List of database nodes to connect to. It should follow the form of username:password@address:port/dbname (postgres:// protocol is appended to the path automatically).";
            };

          };

          session = {

            encryption_key = lib.mkOption {
              type = lib.types.str;
              default = "defaultencryptionkey";
              defaultText = "defaultencryptionkey";
              description = "The encryption key used to produce the client token";
            };

          };

          socket = {

            server_key = lib.mkOption {
              type = lib.types.str;
              default = "defaultkey";
              defaultText = "defaultkey";
              description = "Server key to use to establish a connection to the server";
            };

          };

        };

      };

    };

    user = lib.mkOption {
      type = lib.types.str;
      default = "nakama";
      description = "Nakama user";
    };

    group = lib.mkOption {
      type = lib.types.str;
      default = "nakama";
      description = "Nakama group";
    };

  };

  config = lib.mkIf cfg.enable {

    services.postgresql = lib.mkIf cfg.useLocalPostgres {
      enable = true;
      ensureDatabases = [ "nakama" ];
      ensureUsers = [
        {
          name = "nakama";
          ensureDBOwnership = true;
        }
      ];
      authentication = lib.mkOverride 10 ''
        # type, database, DBuser, auth-method
        local all all trust
        host all all 127.0.0.1/32 trust
      '';

    };

    systemd.services.nakama = {
      description = "Nakama service";
      wantedBy = [ "multi-user.target" ];

      requires = lib.optionals cfg.useLocalPostgres [
        "postgresql.service"
      ];

      after = [ "network-online.target" ]
        ++ lib.optional config.networking.firewall.enable "firewall.service"
        ++ lib.optional cfg.useLocalPostgres "postgresql.service";

      wants = [ "network-online.target" ]
        ++ lib.optional config.networking.firewall.enable "firewall.service";

      environment = {
        USER = cfg.user;
        HOME = cfg.settings.data_dir;
      };

      serviceConfig = {
        Type = "exec";
        ExecStart = "${lib.getExe cfg.package} --config ${settingsFormat.generate "config.yaml" cfg.settings}";
        RestartSec = 10;
        Restart = "always";
        TimeoutStopSec = 30;
        KillMode = "process";
        User = cfg.user;
        Group = cfg.group;
        NoNewPrivileges = "yes";
        PrivateTmp = "yes";
        ProtectSystem = "strict";
        ProtectHome = "yes";
        ReadWritePaths = cfg.settings.data_dir;
        WorkingDirectory = cfg.settings.data_dir;
      };

      unitConfig = {
        Documentation = "https://github.com/heroiclabs/nakama";
      };

    };

    networking.firewall = lib.mkIf cfg.openFirewall {
      allowedTCPPorts = [
        7348 # grpc-api-server-embedded-console
        7349 # grpc-api-server
        7350 # http-api-server
        7351 # http-api-server-embedded-console
      ]
      ++ lib.optionals (cfg.openFirewall && cfg.useLocalPostgres) [
        config.services.postgresql.settings.port
      ];
      allowedUDPPorts = [
        7348 # grpc-api-server-embedded-console
        7349 # grpc-api-server
        7350 # http-api-server
        7351 # http-api-server-embedded-console
      ]
      ++ lib.optionals (cfg.openFirewall && cfg.useLocalPostgres) [
        config.services.postgresql.settings.port
      ];
    };

    systemd.tmpfiles.rules = [
      "d '${cfg.settings.data_dir}' 0750 ${cfg.user} ${cfg.group} - -"
      "z '${cfg.settings.data_dir}' 0750 ${cfg.user} ${cfg.group} - -"
    ];

    users.users.${cfg.user} = {
      isSystemUser = true;
      group = cfg.group;
      description = "Nakama daemon user";
    };

    users.groups.${cfg.group} = { };

    environment.systemPackages = [ pkgs.nakama ];

  };

  meta.maintainers = pkgs.nakama.meta.maintainers;
}
