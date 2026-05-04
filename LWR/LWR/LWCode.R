library(aLBI)
library(readxl)
library(dplyr)
library(ggplot2)



LWdata1 <- read.csv("LWdata.csv")
LW<-LWR(
  LWdata1,
  log_transform = TRUE,
  point_col = "#0072B2",
  line_col = "#000000",
  shade_col = "#56B4E9",
  point_size = 1.5,
  line_size = 1.1,
  alpha = 0.3,
  main = "Length-Weight Relationship",
  xlab = NULL,
  ylab = NULL,
  save_output = TRUE
)
ggsave("LW_plot.png", plot = LW$plot, dpi = 330, width = 8, height = 6, units = "in")

