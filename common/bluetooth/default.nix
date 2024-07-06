{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware = {
    sound.enable = true;
    
    bluetooth.enable = true;

    pulseaudio = {
      enable = lib.mkForce false;
      package = pkgs.pulseaudioFull; # Use extra Bluetooth codecs like aptX
    };
  };
}
