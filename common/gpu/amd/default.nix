{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.amdgpu = {
    initrd.enable = true;

    amdvlk = {
      enable = true;
      support32Bit.enable = true;
    };

    opencl.enable = true;
  };
}
