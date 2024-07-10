{
  description = "Opinionated hardware configuration modules + packages for NixOS.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

  outputs = {
    self,
    nixpkgs,
  }: {
    formatter = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ] (system: nixpkgs.legacyPackages.${system}.alejandra);

    nixosModules = {
      framework-13-amd-7000 = import ./framework/13/amd-7000;
      framework-13-intel-11th = import ./framework/13/intel-11th;
      lenovo-yoga-9i-intel-13th = import ./lenovo/yoga-9i/intel-13th;
      thinkpad-t440p = import ./thinkpad/t440p;

      common-amd-cpu = import ./common/gpu/amd;
      common-amd-gpu = import ./common/cpu/amd;
      common-bluetooth = import ./common/bluetooth;
      common-intel-cpu = import ./common/cpu/intel;
      common-intel-gpu = import ./common/gpu/intel;
      common-laptop = import ./common/laptop;
      common-laptop-amd-gpu = import ./common/laptop/amd-gpu.nix;
      common-laptop-intel-cpu = import ./common/laptop/intel-cpu.nix;
      common-ssd = import ./common/ssd;
    };
  };
}
