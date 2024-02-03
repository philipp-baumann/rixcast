library("rix")

rix(
  r_ver = "latest",
  r_pkgs = NULL,
  system_pkgs = NULL,
  git_pkgs = list(package_name = "rix",
                  repo_url = "https://github.com/b-rodrigues/rix/",
                  branch_name = "master",
                  commit = "d077ffa99c5929015ba5274480b041bbd760cfb7"),
  ide = "other",
  project_path = ".",
  overwrite = TRUE,
  print = TRUE
)