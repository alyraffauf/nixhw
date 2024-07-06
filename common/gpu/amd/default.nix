{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    initrd.kernelModules = ["amdgpu"];
    kernelModules = ["amdgpu"];
  };

  hardware.amdgpu = {
    initrd.enable = true;

    amdvlk = {
      enable = true;
      support32Bit.enable = true;
    };

    opencl.enable = true;
  };
}
