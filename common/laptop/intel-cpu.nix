{
  config,
  lib,
  pkgs,
  ...
}: {
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
}
