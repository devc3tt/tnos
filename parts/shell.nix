{ inputs, ... }: {
  perSystem =
    {
      pkgs,
      system,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.rust-overlay.overlays.default
        ];
      };
      devShells.default = pkgs.mkShell {
        packages = [
          # todo make it actually work
          # HOLD UP I'M STUPID: the thing is, the extensions are all in rust docs
          (pkgs.rust-bin.stable.latest.default.override {
            extensions = [ "rust-analyzer" ];
          })
          pkgs.kdePackages.qtdeclarative
          pkgs.lldb
        ];
      };
    };
}
