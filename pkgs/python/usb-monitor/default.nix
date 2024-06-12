{
  fetchPypi,
  python3,
  lib,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "usb-monitor";
  version = "1.21";

  src = fetchPypi {
    inherit version;
    pname = "usb_monitor";
    sha256 = "sha256-M+BUmbNxQWcULFECexTnp55EZiJ6y3bYCEtSwqKldAk=";
  };

  propagatedBuildInputs = with python3.pkgs; [ pyudev ];

  meta = {
    description = "USBMonitor is an easy-to-use cross-platform library for USB device monitoring that simplifies tracking of connections, disconnections, and examination of connected device attributes on Windows, Linux and MacOs, freeing the user from platform-specific details or incompatibilities";
    homepage = "https://github.com/Eric-Canas/USBMonitor";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
