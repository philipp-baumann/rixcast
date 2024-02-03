if (!require("asciicast")) install.packages("asciicast")
library("asciicast")

src <- file.path("01_cast-with_nix.R")
cast <- asciicast::record(
  script = src,
  typing_speed = 40L,
  cols = 80L,
  title = "Reproducible data science with Nix, part 9 -- rix is looking for testers!"
)

play(cast)

svg <- "rix-0-6-0.svg"
write_svg(cast, path = svg, window = TRUE)

# gif <- "rix-0-6-0.gif"
# write_gif(
#   cast,
#   path = gif,
#   cols = 80L,
#   speed = 3
# )