{
  pkgs,
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
          useLocalPostgres = true;
        };
      };
  };

  testScript = ''
    machine.wait_for_unit("postgresql.service")

    machine.wait_for_unit("nakama.service")

    machine.wait_until_succeeds("pgrep -x nakama")

    machine.wait_until_succeeds("curl --silent http://localhost:7351 | grep -o \"<title>Nakama</title>\"")
  '';

}
