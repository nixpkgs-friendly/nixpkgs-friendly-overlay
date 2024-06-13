{
  fetchFromGitHub,
  pkgs,
  python3,
  lib,
  gtk4,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "StreamController";
  version = "1.5.0-beta.4";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "cacab50464210f83f1702592aa5a5ddc2c98f45c"; # main
    hash = "sha256-WXy6wHsCym1GY7g23slDIq7HifBr/VFBFULy0rYzJ0s=";
  };

  propagatedBuildInputs = (with pkgs; [
    memray
    patchelf
    gtk4
    libadwaita
    libportal-gtk4
    gobject-introspection
    wrapGAppsHook4
    gusb
    hidapi
  ]) ++ (with python3.pkgs; [
    annotated-types
    async-lru
    cairocffi
    cairosvg
    certifi
    cffi
    charset-normalizer
    click
    colorama
    contourpy
    cssselect2
    cycler
    dbus-python
    decorator
    defusedxml
    distlib
    dnspython
    evdev
    filelock
    fonttools
    fuzzywuzzy
    get-video-properties
    gitdb
    gitpython
    idna
    imageio
    imageio-ffmpeg
    indexed-bzip2
    # install
    jinja2
    joblib
    kiwisolver
    linkify-it-py
    loguru
    markdown-it-py
    markupsafe
    matplotlib
    mdit-py-plugins
    mdurl
    # memray (from pkgs)
    meson
    meson-python
    natsort
    nltk
    numpy
    opencv4 # opencv-python==4.9.0.80
    packaging
    # patchelf # patchelf==0.17.2.1, nix patchelf.
    pillow
    # pip-review==1.3.0
    # pipenv==2023.12.1
    platformdirs
    plumbum
    proglog # 0.1.10
    prusalinkpy
    psutil
    pulsectl # 24.4.0, nixpkgs at 23.5.2
    gcodepy # py-gcode-metadata==0.1.0 # missing at nixpkgs
    pycairo
    pyclip
    pycparser
    pydantic
    pydantic-core
    pyenchant
    pygments
    pygobject3
    pygobject-stubs
    pymongo
    pyparsing
    pyperclip
    pyproject-metadata # 0.7.1, nixpkgs at 0.8.0
    pyro5
    pyspellchecker
    python-dateutil
    levenshtein
    # python-levenshtein # Original name: python-Levenshtein
    pyudev
    pyusb
    pyyaml
    rapidfuzz
    regex
    # req2flatpak==0.2.0 # Needs to be packaged for nixpkgs.
    requests
    requirements-parser
    rich
    rpyc
    serpent
    setproctitle
    six
    smmap
    speedtest-cli
    streamcontroller-plugin-tools
    streamdeck
    textual
    tinycss2
    tqdm
    types-setuptools
    setuptools
    typing-extensions
    uc-micro-py
    urllib3
    usb-monitor
    virtualenv
    webencodings
    websocket-client
  ]);

  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.gobject-introspection
    python3.pkgs.pythonRelaxDepsHook
  ];

  pythonRelaxDeps = [
    "filelock"
    "fonttools"
    "gitpython"
    "imageio"
    "jinja2"
    "joblib"
    "levenshtein"
    "matplotlib"
    "memray" # should probably be updated
    "meson-python"
    "packaging"
    "plumbum"
    "pulsectl" # Should probably be updated
    "pydantic"
    "pygobject"
    "pyproject-metadata"
    "rapidfuzz"
    "requirements-parser"
    "smmap"
    "textual"
    "tqdm"
    "types-setuptools"
    "typing-extensions"
    "virtualenv"
    "usb-monitor"
    "prusalinkpy"
  ];

  pythonRemoveDeps = [
    "pipenv"
    "req2flatpak"
    "patchelf"
    "pip-review"
    "install" # seems not used
    "opencv-python" # opencv4 ?
    "py-gcode-metadata" # This should only be needed for 3D printing
    "python-Levenshtein" # levenshtein?
    # "Levenshtein" # levenshtein?
  ];

  format = "pyproject";

  postPatch = ''
    substituteInPlace src/backend/Store/StoreBackend.py \
      --replace-fail "from install import install" ""

    substituteInPlace main.py --replace-fail \
        "os.path.join(\"locales\", \"locales.csv\")" \
        "os.path.join(os.path.dirname(__file__), \"locales\", \"locales.csv\")"

    substituteInPlace autostart.py --replace-fail \
        "shutil.copyfile(os.path.join(\"flatpak\", \"autostart.desktop\"), AUTOSTART_DESKTOP_PATH)" \
        "shutil.copyfile(os.path.join(os.path.dirname(__file__), \"flatpak\", \"autostart.desktop\"), AUTOSTART_DESKTOP_PATH)"
  '';

  preBuild = ''
    cat > setup.py << EOF
from setuptools import setup, find_packages

with open('requirements.txt') as f:
    install_requires = f.read().splitlines()

setup(
  name='${pname}',
  packages=['src', 'locales', 'GtkHelper'],
  package_dir={"": './'},
  include_package_data=True,
  version='${version}',
  install_requires=install_requires,
  scripts=[
    'main.py'
  ],
  entry_points={
    # example: file some_module.py -> function main
    'console_scripts': ['StreamController=main:main']
  },
)
EOF
  '';

  postInstall = ''
    cp -r ./ $out/lib/python3.11/site-packages/
    cp -r $src/locales $out/bin/locales
    # cp -r $src/flatpak $out/bin/flatpak

    install -D flatpak/icon_256.png $out/share/icons/hicolor/256x256/apps/com.core447.StreamController.png
    install -D flatpak/launch.desktop $out/share/applications/com.core447.StreamController.desktop
    install -D flatpak/com.core447.StreamController.metainfo.xml $out/share/metainfo/com.core447.StreamController.metainfo.xml

    mkdir -p "$out/etc/udev/rules.d"

    cp udev.rules $out/etc/udev/rules.d
  '';

  dontWrapGApps = true;
  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';

  passthru.python = python3;

  meta = {
    description = "StreamController is an elegant Linux application designed for the Elgato Stream Deck, offering advanced features like plug-ins and automatic page switching to enhance your streaming and productivity setup";
    downloadPage = "";
    homepage = "https://core447.com/";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
  };
}
