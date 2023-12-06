{ buildGoModule
, fetchFromGitHub
, installShellFiles
, lib
, stdenv
}:

buildGoModule rec {
  pname = "kubevela";
  version = "1.9.7";

  src = fetchFromGitHub {
    owner = "kubevela";
    repo = "kubevela";
    rev = "v${version}";
    hash = "sha256-vkq4XuSE+DeCMRBR7Z276TJIpOi0qEop7FBD2PPiQN4=";
  };

  vendorHash = "sha256-rtzPrbjIhxDUcOZOht0PKidCacvTYUNeNUbisgKKR2A=";

  ldflags = [
    "-s" "-w"
    "-X github.com/oam-dev/kubevela/version.VelaVersion=${version}"
  ];

  subPackages = [ "references/cmd/cli" ];

  CGO_ENABLED = 0;

  HOME = "$TMPDIR"; # Workaround for permission issue in shell completion

  installPhase = ''
    runHook preInstall
    install -Dm755 "$GOPATH/bin/cli" -T $out/bin/vela
    runHook postInstall
  '';

  nativeBuildInputs = [ installShellFiles ];
  postInstall = lib.optionalString (stdenv.hostPlatform == stdenv.buildPlatform) ''
    installShellCompletion --cmd vela \
      --bash <($out/bin/vela completion bash) \
      --zsh <($out/bin/vela completion zsh)
  '';

  meta = {
    description = "An application delivery platform to deploy and operate applications in hybrid, multi-cloud environments";
    downloadPage = "https://github.com/kubevela/kubevela";
    homepage = "https://kubevela.io/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
