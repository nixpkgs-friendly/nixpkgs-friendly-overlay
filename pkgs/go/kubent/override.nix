# Fix-Me: I have abandoned this override because result is not equal. I don't know why this happens.

final: prev:

prev.kubent.overrideAttrs(oa: rec {
  version = "0.7.1";

  src = prev.fetchFromGitHub {
    owner = "doitintl";
    repo = "kube-no-trouble";
    rev = version;
    hash = "sha256-fJRaahK/tDns+edi1GIdYRk4+h2vbY2LltZN2hxvKGI=";
  };

  vendorHash = "sha256-nEc0fngop+0ju8hDu7nowBsioqCye15Jo1mRlM0TtlQ=";

  # Is this (ldflags) the solution???
  ldflags = [
    "-w" "-s"
    "-X main.version=v${version}"
  ];

  passthru.tests.version = prev.testers.testVersion {
    package = final.kubent;
    command = "kubent --version";
  };
})
