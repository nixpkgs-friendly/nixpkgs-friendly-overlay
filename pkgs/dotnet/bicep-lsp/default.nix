{
  autoPatchelfHook,
  buildDotnetModule,
  coreutils,
  dotnetCorePackages,
  fetchFromGitHub,
  icu,
  lib,
  libkrb5,
  openssl,
  stdenv,
}:

buildDotnetModule rec {
  pname = "bicep-lsp";
  version = "0.29.47";

  src = fetchFromGitHub {
    owner = "Azure";
    repo = "bicep";
    rev = "v${version}";
    hash = "sha256-KdaoOejoM/3P1WwDCjDhChOpKA7c4UulPLK7IOVw3o4=";
  };

  projectFile = "src/Bicep.LangServer/Bicep.LangServer.csproj";

  nugetDeps = ./deps.nix;

  # From: https://github.com/Azure/bicep/blob/v0.29.47/global.json#L7
  dotnet-sdk = dotnetCorePackages.sdk_8_0;
  dotnet-runtime = dotnetCorePackages.runtime_8_0;

  nativeBuildInputs = lib.optionals stdenv.isLinux [ autoPatchelfHook ];

  buildInputs = lib.optionals stdenv.isLinux [
    icu
    libkrb5
    openssl
    stdenv.cc.cc.lib
  ];

  doCheck = !(stdenv.isDarwin && stdenv.isAarch64); # mono is not available on aarch64-darwin

  meta = {
    description = "Domain Specific Language (DSL) for deploying Azure resources declaratively";
    homepage = "https://github.com/Azure/bicep/";
    changelog = "https://github.com/Azure/bicep/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ] ++ lib.teams.stridtech.members;
    platforms = lib.platforms.unix;
  };
}
