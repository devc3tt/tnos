{
  lib,
  inputs,
  ...
}: {
  imports = [
    (lib.mkAliasOptionModule ["hj"] ["hjem" "users" "foo"])
  ];
  hjem.extraModules = [inputs.hjem-impure.hjemModules.default];
  hj = {
    enable = true;
    user = "foo";
    directory = "/home/foo";

    # hjem-impure
    impure.enable = true;
  };
}
