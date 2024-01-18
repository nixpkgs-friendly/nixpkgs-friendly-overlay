{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "i686-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;


      # forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
      # systems = [ "x86_64-linux" "aarch64-linux" ];
      # forEachSystem = nixpkgs.lib.genAttrs systems;
      allSystemsPkgs = nixpkgs: value: forAllSystems (system:
        let pkgs =
          import nixpkgs {
            inherit system;
            config = {
              #allowUnfree = true;
              #cudaSupport = true;
            };
            overlays = [
              self.overlays.default
            ];
          };
        in value pkgs
      );
      usePkgs = allSystemsPkgs nixpkgs;
    in
    {
      overlays = {
        python = import ./pkgs/python/overlay.nix;
        go = import ./pkgs/go/overlay.nix;
        java = import ./pkgs/java/overlay.nix;
        misc = import ./pkgs/misc/overlay.nix;
        cpp = import ./pkgs/cpp/overlay.nix;
        default = nixpkgs.lib.composeManyExtensions [
          self.overlays.cpp
          self.overlays.java
          self.overlays.go
          # self.overlays.python
          self.overlays.misc
        ];
      };

      nixosModules.default = import ./modules/default.nix;

      packages = usePkgs (pkgs: rec {
        pkgsDebug = pkgs; # Useful for building anything from pkgs, including nixpkgs-friendly-overlay
        dpy = pkgs.python3.pkgs;
        dpy310 = pkgs.python310Packages;
        dpy311 = pkgs.python311Packages;
        nixpkgsFriendlyPkgs = pkgs.symlinkJoin {
          name = "nixpkgs-friendly-all-packages";
          paths = with pkgs; [
            k3s
            fluxcd
            kubevela
          ];
        };

      });

      #devShells = usePkgs (pkgs: {
      #  llm-foundry = pkgs.callPackage ./shells/mosaicml-llm-foundry { };
      #});

      # hydraJobs = {
      #   inherit (self) packages;
      #   # xxxx.${system} = derivation;
      #   # pkgsMusl.${system}
      # };

      hydraJobs = {
        dagger = forAllSystems (system: self.packages.${system}.pkgsDebug.dagger);
        hello = forAllSystems (system: self.packages.${system}.pkgsDebug.hello);
        pkgsMusl = forAllSystems (system: self.packages.${system}.pkgsDebug.pkgsMusl);
      };

      # builtins.listToAttrs (map
      #   (system: {
      #     name = system;
      #     value = import ./ci/hydra/hydra.nix {
      #       inherit system;
      #       pkgs = self.legacyPackages.${system};
      #     };
      #   })
      #   [ "x86_64-linux" "aarch64-linux"  ]);

    };

}

