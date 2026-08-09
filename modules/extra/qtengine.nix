{ inputs, pkgs, ... }: {
  imports = [ inputs.qtengine.nixosModules.default ];

  programs.qtengine = {
    enable = true;
    config = {
      theme = {
        colorScheme = "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";
        style = "breeze";
      };
    };
  };
}
