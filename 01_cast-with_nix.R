## 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 🏂 ##

install.packages("rix", repos = c("https://b-rodrigues.r-universe.dev",
  "https://cloud.r-project.org")
)

repos <- getOption("repos")
repos["CRAN"] <- "https://cloud.r-project.org"

if (!require("stringr") install.packages("stringr")

library("rix")
library("stringr")

## ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ##

## Current R session (also defined via Nix, but you can use your system's R)  ##

## errors; breaking changes: https://stringr.tidyverse.org/news/index.html
## stringr 1.5.0
## CRAN release: 2022-12-02
stringr::str_subset(c("", "a"), "")

## 🏔🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 🏔 ##

## Unite the power of Nix with {rix} in R to evaluate expr in isolated, 
## pure builds and run-time pure environments

path_env_stringr <- file.path(".", "_env_stringr_1.4.1")

rix_init(
  project_path = path_env_stringr,
  rprofile_action = "overwrite",
  message_type = "simple"
)

# define the subshell
rix(
  r_ver = "latest",
  r_pkgs = "stringr@1.4.1",
  overwrite = TRUE,
  project_path = path_env_stringr
)

out_nix_stringr <- with_nix(
  expr = function() stringr::str_subset(c("", "a"), ""),
  program = "R",
  exec_mode = "non-blocking",
  project_path = path_env_stringr,
  message_type = "verbose" # use "simple" for more clarity
)

# Finally, we can check if the result is really "a" or not:
identical("a", out_nix_stringr)

sessionInfo()