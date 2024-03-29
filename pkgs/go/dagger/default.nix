{ system ? builtins.currentSystem, pkgs, lib, fetchurl, installShellFiles }:
let
  shaMap = {
    x86_64-linux = "sha256-/ZNXcnkLYYyHgq4QV7pD2DDH4EU7T5l2HCZMEeGw7tM=";
    aarch64-linux = "sha256-TbFMyK8uaqGktsxCk4GjG7X8LkTldNwVCtT4oBaV0Vc=";
    x86_64-darwin = "sha256-oVedMCO9ipuoQHQQrCdSk5nCF80sSw6FK+OoutqEPIY=";
    aarch64-darwin = "sha256-6pML66rioWwo9bxyOP+2tDO8X5g65MtMr6IFaGdnnV8=";
  };

  urlMap = {
    x86_64-linux =
      "https://dl.dagger.io/dagger/releases/0.9.5/dagger_v0.9.5_linux_amd64.tar.gz";
    aarch64-linux =
      "https://dl.dagger.io/dagger/releases/0.9.5/dagger_v0.9.5_linux_arm64.tar.gz";
    x86_64-darwin =
      "https://dl.dagger.io/dagger/releases/0.9.5/dagger_v0.9.5_darwin_amd64.tar.gz";
    aarch64-darwin =
      "https://dl.dagger.io/dagger/releases/0.9.5/dagger_v0.9.5_darwin_arm64.tar.gz";
  };
in pkgs.stdenv.mkDerivation {
  pname = "dagger";
  version = "0.9.5";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp dagger $out/bin/
  '';

  postInstall = ''
    installShellCompletion --cmd dagger \
      --bash <($out/bin/dagger completion bash) \
      --fish <($out/bin/dagger completion fish) \
      --zsh <($out/bin/dagger completion zsh)
  '';

  system = system;

  meta = {
    description =
      "A programmable CI/CD engine that runs your pipelines in containers";
    homepage = "https://dagger.io";
    license = lib.licenses.asl20;

    platforms =
      [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
  };
}
