final: prev:

let
  callPackage = final.callPackage;
  pickLatest = (import ../../utils.nix).pickLatest; # Fix-Me
  extensionFromVscodeMarketplace = final.vscode-utils.extensionFromVscodeMarketplace;
in
{
  vscode-extensions = prev.vscode-extensions // {

    andrew-butson.vscode-openai = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=AndrewButson.vscode-openai
      publisher = "AndrewButson";
      name = "vscode-openai";
      version = "1.6.11";
      hash = "sha256-Yfsa33a1jvbgOBRK0aqcL6/IYc/jhcHmu8RHhA35J9A=";
    };

    bradgashler.htmltagwrap = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=bradgashler.htmltagwrap
      publisher = "bradgashler";
      name = "htmltagwrap";
      version = "1.0.0";
      hash = "sha256-WOMfwxyeDLoSwF0xz9tbntDVrUWycJ4bW0rZjfLSzgM=";
    };

    designliquido.designliquido-vscode = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=designliquido.designliquido-vscode
      publisher = "designliquido";
      name = "designliquido-vscode";
      version = "0.12.22";
      hash = "sha256-zZR4lWCMYApQzFdX0kbsSv7qXIIUDrvu9g5Jw58lj4c=";
    };

    gbtb.ponylang = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=gbtb.ponylang
      publisher = "gbtb";
      name = "ponylang";
      version = "0.2.2";
      hash = "sha256-ypSEb4j9Gig0Cpo4cM5IoGMmKv1f9MLTfJCXBZAzg3M=";
    };

    geequlim.godot-tools = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools
      publisher = "geequlim";
      name = "godot-tools";
      version = "2.5.1";
      hash = "sha256-kAzRSNZw1zaECblJv7NzXnE2JXSy9hzdT2cGX+uwleY=";
    };

    woberg.godot-dotnet-tools = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=woberg.godot-dotnet-tools
      publisher = "woberg";
      name = "godot-dotnet-tools";
      version = "0.5.1";
      hash = "sha256-qZdQiW1RvzUR5+5QlVdMPBY82IOPUPs3GNOl6bOhnWM=";
    };

    jeff-hykin.better-nix-syntax = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=jeff-hykin.better-nix-syntax
      publisher = "jeff-hykin";
      name = "better-nix-syntax";
      version = "1.1.5";
      hash = "sha256-9V+ziWk9V4LyQiVNSC6DniJDun+EvcK30ykPjyNsvp0=";
    };

    kcl.kcl-vscode-extension = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=kcl.kcl-vscode-extension
      publisher = "kcl";
      name = "kcl-vscode-extension";
      version = "0.2.2";
      hash = "sha256-iMRIe9IoVebu4KwIYw/558FPBL/NdDNDUy1le1luif8=";
      # Requires: kcl kcl-language-server
    };

    # ms-azuretools.vscode-bicep = callPackage ./ms-azuretools.vscode-bicep { };

    npruehs.pony = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=npruehs.pony
      publisher = "npruehs";
      name = "pony";
      version = "0.0.4";
      hash = "sha256-iAs5YnaO8+GdPrcXupRVy80O45P23F2yRdXP2Dj7F3Y=";
    };

    philhindle.errorlens = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=PhilHindle.errorlens
      publisher = "PhilHindle";
      name = "errorlens";
      version = "1.1.3";
      hash = "sha256-kMbet43DvTGIui7fcP8amCVzS0C/KY9VBVlZ+MlTxyM=";
    };

    saoudrizwan.claude-dev = extensionFromVscodeMarketplace {
      # https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev
      publisher = "saoudrizwan";
      name = "claude-dev";
      version = "3.2.5";
      hash = "sha256-aJnN5zjF6tvUSMqVklNgCgpsfBNi1vw0i66BBFgHB1o=";
    };
  };
}

# To-Do: x = pickLatest (callPackage ./x { }) (prev.x or null);
