# This file was generated by the {rix} R package v0.6.0 on 2024-02-03
# with following call:
# >rix(r_ver = "5ad9903c16126a7d949101687af0aa589b1d7d3d",
#  > r_pkgs = "asciicast@2.3.0",
#  > system_pkgs = NULL,
#  > git_pkgs = list(package_name = "rix",
#  > repo_url = "https://github.com/b-rodrigues/rix/",
#  > branch_name = "master",
#  > commit = "d077ffa99c5929015ba5274480b041bbd760cfb7"),
#  > tex_pkgs = "stringr@1.5.0",
#  > ide = "other",
#  > project_path = ".",
#  > overwrite = TRUE,
#  > print = TRUE)
# It uses nixpkgs' revision 5ad9903c16126a7d949101687af0aa589b1d7d3d for reproducibility purposes
# which will install R version latest
# Report any issues to https://github.com/b-rodrigues/rix
let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/5ad9903c16126a7d949101687af0aa589b1d7d3d.tar.gz") {};
  git_archive_pkgs = [(pkgs.rPackages.buildRPackage {
    name = "rix";
    src = pkgs.fetchgit {
      url = "https://github.com/b-rodrigues/rix/";
      branchName = "master";
      rev = "d077ffa99c5929015ba5274480b041bbd760cfb7";
      sha256 = "sha256-d0YU/YwjWYpDwXeK1Auw+sCqr+Fpbdkp2N4Wyybj1F4=";
    };
    propagatedBuildInputs = builtins.attrValues {
      inherit (pkgs.rPackages) codetools httr jsonlite sys;
    };
  }) (pkgs.rPackages.buildRPackage {
    name = "asciicast";
    src = pkgs.fetchzip {
      url = "https://cran.r-project.org/src/contrib/Archive/asciicast/asciicast_2.3.0.tar.gz";
      sha256 = "sha256-AUtXukccJuvXLSWJNzdfB5nENp1PtEcVDUMc3sDT9Jg=";
    };
    propagatedBuildInputs = builtins.attrValues {
      inherit (pkgs.rPackages) cli curl jsonlite magick processx tibble V8 withr;
    };
  })];
 tex = (pkgs.texlive.combine {
  inherit (pkgs.texlive) scheme-small stringr@1.5.0;
});
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

    buildInputs = [ git_archive_pkgs  tex system_packages  ];
      
  }
