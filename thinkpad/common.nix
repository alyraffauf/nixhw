{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware = {
    enableAllFirmware = true;

    trackpoint = {
      enable = true;
      emulateWheel = true;
    };
  };
}
