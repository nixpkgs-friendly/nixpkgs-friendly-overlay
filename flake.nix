{
  inputs = {
    nixpkgs.url = "github:nixpkgs-friendly/nixpkgs-friendly/friendly";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      allSystemsPkgs = nixpkgs: value:
        forAllSystems (system:
          let
            pkgs = import nixpkgs {
              inherit system;
              config = {
                allowUnfree = true;
                cudaSupport = true;
              };
              overlays = [ self.overlays.default ];
            };
          in value pkgs);
      usePkgs = allSystemsPkgs nixpkgs;
    in {
      overlays = {
        cpp = import ./pkgs/cpp/overlay.nix;
        default = nixpkgs.lib.composeManyExtensions [
          self.overlays.cpp
          self.overlays.go
          self.overlays.java
          self.overlays.misc
          self.overlays.python
        ];
        go = import ./pkgs/go/overlay.nix;
        java = import ./pkgs/java/overlay.nix;
        misc = import ./pkgs/misc/overlay.nix;
        python = import ./pkgs/python/overlay.nix;
      };

      nixosModules.default = import ./modules/default.nix;

      packages = usePkgs (pkgs: {
        pkgsDebug =
          pkgs; # Useful for building anything from pkgs, including nixpkgs-friendly-overlay
        dpy = pkgs.python3.pkgs;
        dpy310 = pkgs.python310Packages;
        dpy311 = pkgs.python311Packages;
        nixpkgsFriendlyPkgs = pkgs.symlinkJoin {
          name = "nixpkgs-friendly-all-packages";
          paths = with pkgs;
            [
              k3s
              # fluxcd
            ];
        };

      });

      #devShells = usePkgs (pkgs: {
      #  llm-foundry = pkgs.callPackage ./shells/mosaicml-llm-foundry { };
      #});

      hydraJobs = forAllSystems (system:
        let
          p = self.packages.${system}.pkgsDebug;
          py = p.python3Packages;
        in {
          biglybt = p.biglybt;
          ### Go / Cloud Native ###
          dagger = p.dagger;
          etcd = p.etcd;
          fluxcd = p.fluxcd;
          go = p.go;
          k3s = p.k3s;
          vcluster = p.vcluster;
          ### Musl ###
          # musl-erlang_nox = p.pkgsMusl.erlang_nox;
          # musl-erlang = p.pkgsMusl.erlang;
          # musl-elixir = p.pkgsMusl.elixir;
          # musl-beam_nox = p.pkgsMusl.beam_nox;
          # musl-beam_minimal = p.pkgsMusl.beam_minimal;
          # musl-go = p.pkgsMusl.go;
          # musl-node = p.pkgsMusl.nodejs;
          # musl-ruby = p.pkgsMusl.ruby;
          ### Python Packages ###
          abstract-singleton = py.abstract-singleton;
          auto-gpt-plugin-template = py.auto-gpt-plugin-template;
          coolname = py.coolname;
          ddsketch = py.ddsketch;
          ddtrace = py.ddtrace;
          envier = py.envier;
          flake8-quotes = py.flake8-quotes;
          loralib = py.loralib;
          openapi-python-client = py.openapi-python-client;
          pyre-check = py.pyre-check;
          pyre-extensions = py.pyre-extensions;
          pytorch-ranger = py.pytorch-ranger;
          sourcery = py.sourcery;
          testslide = py.testslide;
          torch-optimizer = py.torch-optimizer;
        });

    };

}
