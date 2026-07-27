{...}: {
  imports = [
    ../../modules/extra
    ../../homes/foo
    #/${self}/modules/

    ./configuration.nix
  ];
}
