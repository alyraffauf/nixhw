{
  lib,
  pkgs,
  ...
}: {
  hardware = {
    bluetooth.enable = true;

    pulseaudio = {
      enable = lib.mkForce false;
      package = pkgs.pulseaudioFull; # Use extra Bluetooth codecs like aptX

      extraConfig = ''
        load-module module-switch-on-connect
      '';

      support32Bit = true;
    };
  };

  sound.enable = true;
}
