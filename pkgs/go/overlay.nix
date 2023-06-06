final: prev:

let
  fetchpatch2 = prev.fetchpatch2;
  callPackage = final.callPackage;
in
rec {
  etcd_3_5 = callPackage ./etcd/3_5 { };
  etcd = etcd_3_5;

  fluxcd = callPackage ./fluxcd { };

  k3s_1_26 = callPackage ./k3s/1_26 { };
  k3s_1_27 = callPackage ./k3s/1_27 { };
  k3s = k3s_1_27;

  # Fix-Me: Fix workaround for K3s update script
  k3s_noVendorHash = k3s.go-modules.overrideAttrs (_: { vendorSha256 = ""; });
}
