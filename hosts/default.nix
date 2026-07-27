{inputs, ...}: {
  flake.nixosConfigurations = {
    laptop = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        inputs.hjem.nixosModules.default
        inputs.nvf.nixosModules.default
        inputs.mangowm.nixosModules.mango
        inputs.cade.nixosModules.default
        ./laptop
      ];
    };
  };
}
