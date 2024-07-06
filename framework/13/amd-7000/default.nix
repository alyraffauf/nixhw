{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../../common/bluetooth
    ../../../common/cpu/amd
    ../../../common/gpu/amd
    ../../../common/laptop
    ../../../common/laptop/amd-gpu.nix
    ../../../common/ssd
    ../../common.nix
    ../common.nix
  ];

  boot.initrd.availableKernelModules = ["nvme" "sd_mod" "thunderbolt" "usb_storage" "xhci_pci"];
}
