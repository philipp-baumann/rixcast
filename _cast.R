install.packages("asciicast")

src <- file.path("01_cast-with_nix.R")
cast <- asciicast::record(src)
svg <- tempfile(fileext = ".svg")
asciicast::write_svg(cast, svg, window = TRUE)