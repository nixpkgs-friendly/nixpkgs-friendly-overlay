{
  autoPatchelfHook,
  lib,
  stdenv,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
  mono,
  patchelf,
  icu,
  openssl,
  coreutils
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

  nativeBuildInputs = lib.optionals stdenv.isLinux [ patchelf ]; # autoPatchelfHook 

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



  postPatch =
    ''
      patchelf_add_icu_as_needed() {
        declare elf="''${1?}"
        declare icu_major_v="${lib.head (lib.splitVersion (lib.getVersion icu.name))}"

        for icu_lib in icui18n icuuc icudata; do
          patchelf --add-needed "lib''${icu_lib}.so.$icu_major_v" "$elf"
        done
      }

      patchelf_common() {
        declare elf="''${1?}"

        patchelf_add_icu_as_needed "$elf"
        patchelf --add-needed "libssl.so" "$elf"
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
          --set-rpath "${
            lib.makeLibraryPath [
              stdenv.cc.cc
              openssl
              icu.out
            ]
          }:\$ORIGIN" \
          "$elf"
      }

      # substituteInPlace dist/extension.js \
      #   --replace 'uname -m' '${lib.getExe' coreutils "uname"} -m'

    '';
    # + (lib.concatStringsSep "\n" (
    #   map (bin: ''
    #     chmod +x "${bin}"
    #   '') extInfo.binaries
    # ))
    # + lib.optionalString stdenv.isLinux (
    #   lib.concatStringsSep "\n" (
    #     map (bin: ''
    #       patchelf_common "${bin}"
    #     '') extInfo.binaries
    #   )
    #);



#  >     libgcc_s.so.1 -> not found!
#        > auto-patchelf: 6 dependencies could not be satisfied
#        > error: auto-patchelf could not satisfy dependency libssl.so wanted by /nix/store/28b8n3wlmsn7mpzgzr2qhx1nb9i6gzzv-bicep-lsp-0.27.1/lib/bicep-lsp/Bicep.LangServer
#        > error: auto-patchelf could not satisfy dependency libgssapi_krb5.so wanted by /nix/store/28b8n3wlmsn7mpzgzr2qhx1nb9i6gzzv-bicep-lsp-0.27.1/lib/bicep-lsp/Bicep.LangServer
#        > error: auto-patchelf could not satisfy dependency libicui18n.so wanted by /nix/store/28b8n3wlmsn7mpzgzr2qhx1nb9i6gzzv-bicep-lsp-0.27.1/lib/bicep-lsp/Bicep.LangServer
#        > error: auto-patchelf could not satisfy dependency libicuuc.so wanted by /nix/store/28b8n3wlmsn7mpzgzr2qhx1nb9i6gzzv-bicep-lsp-0.27.1/lib/bicep-lsp/Bicep.LangServer
#        > error: auto-patchelf could not satisfy dependency libstdc++.so.6 wanted by /nix/store/28b8n3wlmsn7mpzgzr2qhx1nb9i6gzzv-bicep-lsp-0.27.1/lib/bicep-lsp/Bicep.LangServer
#        > error: auto-patchelf could not satisfy dependency libgcc_s.so.1 wanted by /nix/store/28b8n3wlmsn7mpzgzr2qhx1nb9i6gzzv-bicep-lsp-0.27.1/lib/bicep-lsp/Bicep.LangServer
#        > auto-patchelf failed to find all the required dependencies.
#        > Add the missing dependencies to --libs or use `--ignore-missing="foo.so.1 bar.so etc.so"`.



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
