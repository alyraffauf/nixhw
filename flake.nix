{
  description = "Opinionated hardware configuration modules for NixOS";

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
    };
  };
}
