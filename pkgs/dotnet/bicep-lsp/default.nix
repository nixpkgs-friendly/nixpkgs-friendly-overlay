{ autoPatchelfHook
, lib
, stdenv
, buildDotnetModule
, fetchFromGitHub
, dotnetCorePackages
, mono
}:

buildDotnetModule rec {
  pname = "bicep-lsp";
  version = "0.27.1";

  src = fetchFromGitHub {
    owner = "Azure";
    repo = "bicep";
    rev = "v${version}";
    hash = "sha256-7yEsxKUG2jhki1u5CObdjN4JMnEcAYR+SoGPaNJ+9Fs=";
  };

  projectFile = "src/Bicep.LangServer/Bicep.LangServer.csproj";

  nugetDeps = ./deps.nix;

  dotnet-sdk = dotnetCorePackages.sdk_8_0;

  dotnet-runtime = dotnetCorePackages.runtime_8_0;

  nativeBuildInputs = lib.optionals stdenv.isLinux [ autoPatchelfHook ];

  #doCheck = !(stdenv.isDarwin && stdenv.isAarch64); # mono is not available on aarch64-darwin
  # 1 test fails: Verify_snippet_cache

  #nativeCheckInputs = [ mono ];

  #testProjectFile = "src/Bicep.LangServer.UnitTests/Bicep.LangServer.UnitTests.csproj";

  #passthru.updateScript = ./updater.sh;

  # Tell autoPatchelf about runtime dependencies.
  # (postFixup phase is run before autoPatchelfHook.)
  # postFixup = lib.optionalString stdenv.targetPlatform.isLinux ''
  #   patchelf \
  #     --add-needed libc.so \
  #     $out/lib/bicep-lsp/libSystem.IO.Ports.Native.so
  # '';


#libSystem.IO.Ports.Native.so
#	linux-vdso.so.1 (0x00007ffe06aad000)
#	libc.so.6 => /nix/store/k7zgvzp2r31zkg9xqgjim7mbknryv6bs-glibc-2.39-52/lib/libc.so.6 (0x00007f770e02d000)
#	/nix/store/k7zgvzp2r31zkg9xqgjim7mbknryv6bs-glibc-2.39-52/lib64/ld-linux-x86-64.so.2 (0x00007f770e222000)



  meta = {
    broken = stdenv.isDarwin;
    description = "Domain Specific Language (DSL) for deploying Azure resources declaratively";
    homepage = "https://github.com/Azure/bicep/";
    changelog = "https://github.com/Azure/bicep/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ khaneliman ];
  };
}
