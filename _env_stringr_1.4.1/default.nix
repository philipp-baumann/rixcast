# This file was generated by the {rix} R package v0.5.1.9000 on 2024-02-03
# with following call:
# >rix(r_ver = "5ad9903c16126a7d949101687af0aa589b1d7d3d",
#  > r_pkgs = "stringr@1.4.1",
#  > project_path = path_env_stringr,
#  > overwrite = TRUE)
# It uses nixpkgs' revision 5ad9903c16126a7d949101687af0aa589b1d7d3d for reproducibility purposes
# which will install R version latest
# Report any issues to https://github.com/b-rodrigues/rix
let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/5ad9903c16126a7d949101687af0aa589b1d7d3d.tar.gz") {};
  git_archive_pkgs = [ (pkgs.rPackages.buildRPackage {
    name = "stringr";
    src = pkgs.fetchzip {
      url = "https://cran.r-project.org/src/contrib/Archive/stringr/stringr_1.4.1.tar.gz";
      sha256 = "sha256-Cv/ZYjk3h8iWgqcoh3xwpOlqEgBoW50KtUBqgUlFh8Q=";
    };
    propagatedBuildInputs = builtins.attrValues {
      inherit (pkgs.rPackages) glue magrittr stringi;
    };
  })];
  system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocales nix ;
};
  in
  pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [ git_archive_pkgs   system_packages  ];
      
  }
