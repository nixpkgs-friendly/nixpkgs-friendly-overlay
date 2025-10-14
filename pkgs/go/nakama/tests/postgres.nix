{
  pkgs,
  config,
  lib,
  ...
}:

pkgs.testers.runNixOSTest {
  name = "nakama-postgres-test";

  nodes = {
    machine1-nakama-server =
      { ... }:
      {
        imports = [
          ../../../../modules/nakama.nix
        ];
        services.nakama = {
          enable = true;
          openFirewall = true;
          useLocalPostgres = true;
        };
      };
  };

  testScript = ''
    machine.wait_for_unit("postgresql.service")

    machine.succeed("nakama migrate up --database.address nakama@127.0.0.1:5432")

    machine.wait_for_unit("nakama.service")

    machine.wait_until_succeeds("pgrep -x nakama")

    machine.succeed("curl --silent http://127.0.0.1:7351 | grep -o \"<title>Nakama</title>\"")
  '';

}
