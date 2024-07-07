{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware = {
    bluetooth.enable = true;

    pulseaudio = {
      enable = lib.mkForce false;
      package = pkgs.pulseaudioFull; # Use extra Bluetooth codecs like aptX
    };
  };

  sound.enable = true;
}
