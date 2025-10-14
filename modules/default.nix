{ ... }:

{
  imports = [
    # ./etcd.nix
    ./nakama.nix
    ./solaar.nix
    ./stream-controller.nix
  ];
}
