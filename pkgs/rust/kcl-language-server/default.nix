{
  kcl,
  lib,
  pkg-config,
  pkgs,
  protobuf
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "kcl-language-server";
  version = "0.10.8";

  src = pkgs.fetchFromGitHub {
    owner = "kcl-lang";
    repo = "kcl";
    rev = "v${version}";
    hash = "sha256-ls/Qe/nw3UIfZTjt7r7tzUwxlb5y4jBK2FQlOsMCttM=";
  };

  sourceRoot = "${src.name}/kclvm";

  cargoLock.lockFile = "${src}/kclvm/Cargo.lock";
  cargoLock.outputHashes = {
    "inkwell-0.2.0" = "sha256-JxSlhShb3JPhsXK8nGFi2uGPp8XqZUSiqniLBrhr+sM=";
    "protoc-bin-vendored-3.2.0" = "sha256-cYLAjjuYWat+8RS3vtNVS/NAJYw2NGeMADzGBL1L2Ww=";
  };

  PROTOC = "${protobuf}/bin/protoc";
  PROTOC_INCLUDE = "${protobuf}/include";

  buildAndTestSubdir = "tools/src/LSP";
  # cargoBuildFlags = [ "--release" ];

  nativeBuildInputs = [
    pkg-config
    protobuf
  ];

  doCheck = false;

  meta = {
    description = "Language Server Protocol for KCL Programming Language";
    changelog = "https://github.com/kcl-lang/kcl/releases/tag/v${version}";
    license = lib.licenses.asl20;
    downloadPage = "https://github.com/kcl-lang/kcl/tree/v${version}/kclvm/tools/src/LSP";
    maintainers = [ ];
  };
}

# Credit: https://github.com/aldoborrero/mynixpkgs/blob/main/pkgs/by-name/kc/kcl-language-server/default.nix
