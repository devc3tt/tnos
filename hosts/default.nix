{inputs, ...}: {
  flake.nixosConfigurations = {
    laptop = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        inputs.hjem.nixosModules.default
        inputs.nvf.nixosModules.default
        inputs.cade.nixosModules.default
        inputs.spicetify-nix.nixosModules.spicetify
        ./laptop
      ];
    };
  };
}
