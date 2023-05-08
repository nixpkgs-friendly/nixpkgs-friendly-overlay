{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
      allSystemsPkgs = nixpkgs: value: forAllSystems (system:
        let pkgs =
          import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              self.overlays.default
            ];
          };
        in value pkgs
      );
      usePkgs = value: allSystemsPkgs nixpkgs value;
    in
    {
      overlays = {
        python = import ./pkgs/python/overlay.nix;
        default = nixpkgs.lib.composeManyExtensions [
          self.overlays.python
        ];
      };

      packages = usePkgs (pkgs: rec {
        pkgsDebug = pkgs; # Useful for building anything from pkgs, including nixpkgs-friendly-overlay
      });

      devShells = usePkgs (pkgs: {
        llm-foundry = pkgs.callPackage ./shells/mosaicml-llm-foundry { };
      });
    };

}
