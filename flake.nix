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
            config = {
              allowUnfree = true;
              cudaSupport = true;
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
        misc = import ./pkgs/misc/overlay.nix;
        default = nixpkgs.lib.composeManyExtensions [
          self.overlays.go
          self.overlays.python
          self.overlays.misc
        ];
      };

      packages = usePkgs (pkgs: rec {
        pkgsDebug = pkgs; # Useful for building anything from pkgs, including nixpkgs-friendly-overlay
        dpy = pkgs.python3.pkgs;
        dpy310 = pkgs.python310Packages;
        dpy311 = pkgs.python311Packages;
      });

      devShells = usePkgs (pkgs: {
        llm-foundry = pkgs.callPackage ./shells/mosaicml-llm-foundry { };
      });
    };

}
