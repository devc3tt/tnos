{lib, ...}: {
  imports = [
    (lib.mkAliasOptionModule ["hj"] ["hjem" "users" "foo"])
  ];
  hj = {
    enable = true;
    user = "foo";
    directory = "/home/foo";

    files = {
      # configs with folders
      ".config/mango".source = ./config/mango;

      # configs with files
      ".config/fuzzel/fuzzel.ini" = {
        generator = lib.generators.toINI {};
        value = {
          main = {
            font = "JetbrainsMono Nerd Font:size=10";
          };
        };
      };
    };
  };
}
