{
  lib,
  pkgs,
  ...
}: {
  services = {
    pipewire.wireplumber.extraConfig = {
      # Pipewire eats battery by never disabling the camera.
      "10-disable-camera" = {
        "wireplumber.profiles" = {
          main = {
            "monitor.libcamera" = "disabled";
          };
        };
      };
    };

    power-profiles-daemon.enable = lib.mkDefault true;

    udev.extraRules = ''
      SUBSYSTEM=="power_supply", ATTR{online}=="1", ACTION=="change", RUN+="${lib.getExe pkgs.power-profiles-daemon} set balanced"

      # Check for battery capacity and switch to power-saver if necessary
      SUBSYSTEM=="power_supply", ATTR{online}=="0", ACTION=="change", \
        RUN+="/bin/sh -c '\
          if [ -f /sys/class/power_supply/BAT0/capacity ]; then \
            CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity); \
          elif [ -f /sys/class/power_supply/BAT1/capacity ]; then \
            CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity); \
          else \
            CAPACITY=100; \
          fi; \
          if [ $CAPACITY -lt 80 ]; then \
            ${lib.getExe pkgs.power-profiles-daemon} set power-saver; \
          fi' \
        "
    '';

    upower.enable = lib.mkDefault true;
  };
}
