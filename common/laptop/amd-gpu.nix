{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    # Disable AMD Backlight Management.
    # ABM severely degrades display quality for miniscule power efficiency gains.
    kernelParams = ["amdgpu.abmlevel=0"];
  };
}
