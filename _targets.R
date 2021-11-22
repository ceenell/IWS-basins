library(targets)

tar_option_set(packages = c(
  "nhdplusTools",
  "sf",
  "tidyverse"))

source("1_fetch.R")
source("2_process.R")

c(p1, p2)
