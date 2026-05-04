library(readxl)
library(tidyverse)
library(ggsci)
library(ggh4x)

# Read data
df <- read_excel("lbspr_sensitivity_CI.xlsx")

# Ensure valid column names
colnames(df) <- make.names(colnames(df))

# Pivot all 4 parameters to long format
df_long <- df %>%
  pivot_longer(
    cols = matches("^(F\\.M|SPR|SL50|SL95)"),
    names_to = c("Par", "range"),
    names_pattern = "(F\\.M|SPR|SL50|SL95)(_LCL|_UCL)?"
  ) %>%
  mutate(
    range = case_when(
      range == "_LCL" ~ "LCI",
      range == "_UCL" ~ "UCI",
      TRUE ~ "Mean"
    ),
    # Convert back to display-friendly name
    Par = recode(Par, "F.M" = "F/M")
  )

# Plot
ggplot(df_long, aes(x = Scenario, y = value, fill = Par)) +
  geom_boxplot(show.legend = FALSE) +
  facet_wrap(~Par, scales = "free_y") +
  
  scale_fill_manual(
    values = c(
      "F/M"  = "#BFD8B8",
      "SPR"  = "skyblue",
      "SL50" = "beige",
      "SL95" = "pink"
    )
  ) +
  
  ggtitle("LB-SPR") +
  
  theme_classic(base_family = "serif") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      size = 16,
      face = "bold"
    ),
    
    panel.grid.major.y = element_line(color = "grey85", linewidth = 0.4),
    panel.grid.minor.y = element_line(color = "grey90", linewidth = 0.2),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    
    axis.text.x = element_text(angle = 0, hjust = 0.5, size = 9),
    axis.text.y = element_text(size = 9),
    
    axis.title.x = element_text(size = 13, face = "bold"),  # ↑ bigger & bold
    axis.title.y = element_blank(),                          
    
    strip.background = element_blank(),
    strip.text = element_text(
      face = "bold",
      size = 11
    )
  ) +
  xlab("Scenarios")   # ← rename x-axis label





















 
 