{ pkgs, system }:

let
  inherit (pkgs) lib stdenv;
in

{
  pkgsMusl =  pkgs.pkgsMusl;
}
