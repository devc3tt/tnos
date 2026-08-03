{inputs, ...}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.rust-overlay.overlays.default
      ];
    };
    devShells.default = pkgs.mkShell {
      packages = [
        (pkgs.rust-bin.stable.latest.default.override {
          extensions = ["rust-analyzer"];
        })
        pkgs.bun
      ];
    };
  };
}
