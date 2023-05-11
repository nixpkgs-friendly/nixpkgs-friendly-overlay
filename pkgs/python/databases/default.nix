{ lib
, aiomysql
, aiopg
, aiosqlite
, asyncmy
, asyncpg
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
, pythonOlder
, sqlalchemy
, fetchpatch2
}:

buildPythonPackage rec {
  pname = "databases";
  version = "unstable-2023-01-16";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "encode";
    repo = pname;
    rev = "b6eba5f7a19eaf8966e3821f44fe00f4770cb822";
    hash = "sha256-GvNg6m1Mo+WS+xqtE3vPspcHycw0hB1IFNqWRJprLms=";
  };

  patches = [
    # https://github.com/encode/databases/pull/540
    (fetchpatch2 {
      url = "https://github.com/encode/databases/pull/540.patch";
      hash = "sha256-Rl63/b80IlBjw0HS1mFa2erYSzs/rfou3aCftC0f6TI";
    })
  ];

  propagatedBuildInputs = [
    sqlalchemy
  ];

  passthru.optional-dependencies = {
    postgresql = [
      asyncpg
    ];
    asyncpg = [
      asyncpg
    ];
    aiopg = [
      aiopg
    ];
    mysql = [
      aiomysql
    ];
    aiomysql = [
      aiomysql
    ];
    asyncmy = [
      asyncmy
    ];
    sqlite = [
      aiosqlite
    ];
    aiosqlite = [
      aiosqlite
    ];
  };

  nativeCheckInputs = [
    pytestCheckHook
  ];

  disabledTestPaths = [
    # circular dependency on starlette
    "tests/test_integration.py"
    # TEST_DATABASE_URLS is not set.
    "tests/test_databases.py"
    "tests/test_connection_options.py"
  ];

  pythonImportsCheck = [
    "databases"
  ];

  meta = with lib; {
    description = "Async database support for Python";
    homepage = "https://github.com/encode/databases";
    changelog = "https://github.com/encode/databases/releases/tag/${version}";
    license = licenses.bsd3;
    maintainers = with maintainers; [ costrouc ];
    # https://github.com/encode/databases/issues/530
    # broken = lib.versionAtLeast sqlalchemy.version "2.0.0";
  };
}
