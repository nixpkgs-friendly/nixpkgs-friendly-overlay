{
  pkgs,
  config,
  lib,
  stdenv,
  callPackage,
  fetchurl,
  ...
}@args:

let
  buildFirefoxXpiAddon = lib.makeOverridable (
    {
      stdenv ? args.stdenv,
      fetchurl ? args.fetchurl,
      pname,
      version,
      addonId,
      url,
      sha256,
      meta,
      ...
    }:
    stdenv.mkDerivation {
      name = "${pname}-${version}";
      inherit meta;
      src = fetchurl { inherit url sha256; };
      preferLocalBuild = true;
      allowSubstitutes = true;
      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    }
  ); # <- End of makeOverridable
in
{
  darkreader = buildFirefoxXpiAddon rec {
    pname = "darkreader";
    version = "4.9.106";
    addonId = "addon@darkreader.org";
    url = "https://addons.mozilla.org/firefox/downloads/file/4223104/darkreader-${version}.xpi";
    sha256 = "sha256-06/hOZKMPDC9ETR8CKM2D6NBe+RmfEfz3hn9wKuS2p8=";
    meta = {
      homepage = "https://darkreader.org/";
      downloadPage = "https://addons.mozilla.org/en-US/firefox/addon/darkreader/";
      description = "Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing.";
      license = lib.licenses.mit;
      platforms = lib.platforms.all;
    };
  };

  "enhancer-for-youtube" = buildFirefoxXpiAddon rec {
    pname = "enhancer-for-youtube";
    version = "2.0.130.1";
    addonId = "enhancerforyoutube@maximerf.addons.mozilla.org";
    url = "https://addons.mozilla.org/firefox/downloads/file/4225147/youtube_enhancer_vc-${version}.xpi";
    sha256 = "sha256-hLxdg70dn1Gcg0Q1B/i5VvApPJZGzpO2kd+LOn+CyOA=";
    meta = {
      homepage = "https://www.mrfdev.com/enhancer-for-youtube";
      description = "Take control of YouTube and boost your user experience!";
      downloadPage = "https://addons.mozilla.org/en-US/firefox/addon/enhancer-for-youtube/";
      license = {
        shortName = "enhancer-for-youtube";
        fullName = "Custom License for Enhancer for YouTube™";
        url = "https://addons.mozilla.org/en-US/firefox/addon/enhancer-for-youtube/license/";
        free = false;
      };
      platforms = lib.platforms.all;
    };
  };

  "startpage-private-search" = buildFirefoxXpiAddon rec {
    pname = "startpage-private-search";
    version = "2.0.3";
    addonId = "{20fc2e06-e3e4-4b2b-812b-ab431220cada}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3421533/startpage_private_search-${version}.xpi";
    sha256 = "sha256-57VQDagc02AzZ4C7x8jpLGBE7eQLS/vL20AezzjptDk=";
    meta = {
      description = "This extension protects users from being tracked while allowing them to search the web in complete private mode.";
      downloadPage = "https://addons.mozilla.org/en-US/firefox/addon/startpage-private-search/";
      license = lib.licenses.gpl3;
      platforms = lib.platforms.all;
    };
  };

  "ublock-origin" = buildFirefoxXpiAddon {
    pname = "ublock-origin";
    version = "1.64.0";
    addonId = "uBlock0@raymondhill.net";
    url = "https://addons.mozilla.org/firefox/downloads/file/4216633/ublock_origin-1.55.0.xpi";
    sha256 = "sha256-oCyh0yc3w0N/l1U+XKrq1keaZqwfj/O4SgbPprsMdkc=";
    meta = {
      homepage = "https://github.com/gorhill/uBlock#ublock-origin";
      description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
      downloadPage = "https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/";
      license = lib.licenses.gpl3;
      platforms = lib.platforms.all;
    };
  };

} # <- End of Extensions

# https://github.com/nix-community/nur-combined/tree/master/repos/rycee/pkgs/firefox-addons
