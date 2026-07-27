{...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        theme.enable = true;
        theme.style = "dark";
        theme.name = "gruvbox";
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          rust.enable = true;
          clang.enable = true;
          nix.enable = true;
          qml.enable = true;
        };
        #autocomplete.nvim-cmp.enable = true;
        autocomplete.blink-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;

        telescope.enable = true;

        ui = {
          colorizer.enable = true;
        };
      };
    };
  };
}
