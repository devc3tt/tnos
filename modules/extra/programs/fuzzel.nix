{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.fuzzel];
  hjem.users.foo.xdg.config.files."fuzzel/fuzzel.ini" = {
    generator = lib.generators.toINI {};
    value = {
      main = {
        font = "JetbrainsMono Nerd Font:size=10";
      };
    };
  };
}
