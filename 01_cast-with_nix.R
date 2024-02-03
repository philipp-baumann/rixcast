cat("Blog: Bruno Rodrigues")
cat("Reproducible data science with Nix, part 9 -- rix is looking for testers!")
cat()
cat("https://www.brodrigues.co/blog/2024-02-02-nix_for_r_part_9/")
cat("{rix} is looking for beta testers ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛")

## 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 ##

repos <- getOption("repos")
repos["CRAN"] <- "https://cran.r-project.org/"
options(repos = repos)

install.packages("rix", repos = c("https://b-rodrigues.r-universe.dev",
  "https://cloud.r-project.org")
)

library("rix")

rix(
  r_ver = "4.3.1",
  r_pkgs = c("stringr@1.5.0"),
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

nix_path <- "/nix/var/nix/profiles/default/bin"
path <- Sys.getenv("PATH")
has_nix_path <- grepl(pattern = nix_path, x = path)
if (isFALSE(has_nix_path)) {
  Sys.setenv(PATH=paste0(path, ":", nix_path))
}
has_nix_cli <- Sys.which("nix-build")

if (isTRUE(has_nix_path) && nzchar(has_nix_cli)) {
  cat ("❤️ Your have Nix installed on your system ❤️\n")
  nix_build(
    project_path = ".",
    exec_mode = "non-blocking"
  )
} else {
  cat("😻 You will love Nix because no fiddling with system libraries\n")
  # get most recent versions from CRAN
  install.packages(c("stringr", "asciicast"))
}

library("stringr")

## ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ##

## Current R session (also defined via Nix, but you can use your system's R)  ##

## errors; breaking changes: https://stringr.tidyverse.org/news/index.html
## stringr 1.5.0
## ""... str_detect(x, "") returned TRUE for all non-empty strings) and made it
## easy to make mistakes when programming."
## CRAN release: 2022-12-02
try(stringr::str_subset(c("", "a"), ""))

## 🏔🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 ##

## Unite the power of Nix with {rix} in R to evaluate expr in isolated, 
## pure builds and run-time pure environments

path_env_stringr <- file.path(".", "_env_stringr_1.4.1")

rix_init(
  project_path = path_env_stringr,
  rprofile_action = "overwrite",
  message_type = "simple"
)

# Define the subshell
rix(
  r_ver = "latest",
  r_pkgs = "stringr@1.4.1",
  overwrite = TRUE,
  project_path = path_env_stringr
)

# Evaluate `stringr::str_subset(c("", "a"), "")` inside that subshell
out_nix_stringr <- with_nix(
  expr = function() stringr::str_subset(c("", "a"), ""),
  program = "R",
  exec_mode = "blocking",
  project_path = path_env_stringr,
  message_type = "verbose" # use "simple" for more clarity
)

cat("\n\n")

# Finally, we can check if the result is really "a" or not:
identical("a", out_nix_stringr)
cat("✅")

# double check
with_nix(
  expr = function() {library("stringr"; sessionInfo()}
  program = "R",
  exec_mode = "blocking",
  project_path = path_env_stringr,
  message_type = "verbose"
)
