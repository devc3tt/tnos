{lib, ...}: {
  imports = [
    (lib.mkAliasOptionModule ["hj"] ["hjem" "users" "foo"])
  ];
  hjem = {
    users.foo = {
      enable = true;
      user = "foo";
      directory = "/home/foo";

      files = {
        # configs with folders
        ".config/mango".source = ./config/mango;
        ".config/quickshell".source = ./config/quickshell;

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
  };
}
