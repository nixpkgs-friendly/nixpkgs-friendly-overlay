final: prev:

prev.nakama.overrideAttrs (oa: {
  passthru = (oa.passthru or { }) // {
    tests = (oa.passthru.tests or { }) // {
      postgres = final.callPackage ./tests/postgres.nix { };
    };
  };
})
