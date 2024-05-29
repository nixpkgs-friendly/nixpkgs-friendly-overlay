final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
  extensionFromVscodeMarketplace = final.vscode-utils.extensionFromVscodeMarketplace;
in
{
  vscode-extensions = prev.vscode-extensions // {

    bradgashler.htmltagwrap = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=bradgashler.htmltagwrap
      publisher = "bradgashler";
      name = "htmltagwrap";
      version = "1.0.0";
      hash = "sha256-WOMfwxyeDLoSwF0xz9tbntDVrUWycJ4bW0rZjfLSzgM=";
    };

    jeff-hykin.better-nix-syntax = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=jeff-hykin.better-nix-syntax
      publisher = "jeff-hykin";
      name = "better-nix-syntax";
      version = "1.1.5";
      hash = "sha256-9V+ziWk9V4LyQiVNSC6DniJDun+EvcK30ykPjyNsvp0=";
    };

    ms-azuretools.vscode-bicep = callPackage ./ms-azuretools.vscode-bicep { };

    npruehs.pony = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=npruehs.pony
      publisher = "npruehs";
      name = "pony";
      version = "0.0.4";
      hash = "sha256-iAs5YnaO8+GdPrcXupRVy80O45P23F2yRdXP2Dj7F3Y=";
    };

    signageos.signageos-vscode-sops = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=signageos.signageos-vscode-sops
      publisher = "signageos";
      name = "signageos-vscode-sops";
      version = "0.9.1";
      hash = "sha256-b1Gp+tL5/e97xMuqkz4EvN0PxI7cJOObusEkcp+qKfM=";
    };

  };
}

# To-Do: x = pickLatest (callPackage ./x { }) (prev.x or null);
