{pkgs, ...}: {
  environment.systemPackages = [
    (
      pkgs.mpv.override {
        scripts = [
          # mpv-mpris
          pkgs.mpvScripts.mpris
        ];
      }
    )
  ];
}
