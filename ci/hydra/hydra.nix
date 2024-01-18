{ pkgs, system }:

let
  inherit (pkgs) lib stdenv;
in

{
  pkgsMusl =  {
    inherit (pkgs) pkgsMusl;
  };
}
