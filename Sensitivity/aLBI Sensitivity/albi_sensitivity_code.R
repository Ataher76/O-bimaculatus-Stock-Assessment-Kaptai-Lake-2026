library(aLBI)
library(readxl)
library(dplyr)
library(ggplot2)

bmodel <- read_excel("Bin3.xlsx", sheet = 2) # import your dataet by name you set

FishPar(data = bmodel,
        progress = T,
        resample = 1000,
        Linf = 82.12,
        #Linf_sd = 0.5, ; this set 0.5 by default
        Lmat = 41.5
        #Lmat_sd = 0.5; this set 0.5 by default
        )

# Preserve values each time you run for a single scenario. you will run above code for 4/6/8 times for differen value of Linf and Lmat
# I'll provide a excel file where you will preserve the values and then follow the code below
library(readxl)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggsci)



# sensitivity for length parameters
senalbi <- read_excel("SenA.xlsx", sheet = 2)

senlen <- senalbi %>% select(1,2, 4:6)

senlen$Code <- as.factor(senlen$Code)


l<-senlen %>% 
  #select(2:5) %>%  
  pivot_longer(cols = 3:5, names_to = "range", values_to = "value") %>% 
  ggplot(aes(x = Code, y = value, fill = Par)) +
  
  geom_boxplot(show.legend = FALSE) +
  
  facet_wrap(~Par, scales = "free_y") +
  
  scale_x_discrete(
    labels = c("BM", "S1", "S2", "S3", "S4", "S5")
  ) +
  
  scale_fill_manual(
    values = c(
      "Linf"     = "#BFD8B8",
      "Lmat"     = "skyblue",
      "Lmax"     = "beige",
      "Lopt"     = "pink",
      "Lopt_m10" = "#D6C1E6",
      "Lopt_p10" = "#E6D8A3"
    )
  ) +
  
  ggtitle("aLBI Sensitivity Analysis") +
  
  theme_classic(base_family = "serif") +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      size = 16,
      face = "bold"
    ),
    
    panel.grid.major.y = element_line(
      color = "grey85",
      linewidth = 0.4
    ),
    panel.grid.minor.y = element_line(
      color = "grey90",
      linewidth = 0.2
    ),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    
    axis.text.x = element_text(
      size = 9,
      hjust = 0.5
    ),
    axis.text.y = element_text(size = 9),
    
    axis.title.x = element_text(
      size = 13,
      face = "bold"
    ),
    axis.title.y = element_blank(),
    
    strip.background = element_blank(),
    strip.text = element_text(
      face = "bold",
      size = 11
    )
  ) +
  
  xlab("Scenarios")

ggsave(
  "len_indicators.pdf",
  plot  =l,
  width = 21,
  height = 13,
  units = "cm",
  device = cairo_pdf
)



 #Froese

senalbi <- read_excel("SenA.xlsx", sheet = 3)

senlen <- senalbi %>% select(1, 2, 4:6)
senlen$Code <- as.factor(senlen$Code)

p_froese <- senlen %>% 
  pivot_longer(cols = 3:5, names_to = "range", values_to = "value") %>% 
  ggplot(aes(x = Code, y = value, fill = Par)) +
  
  geom_boxplot(show.legend = FALSE) +
  
  facet_wrap(~ factor(Par, levels = c("Pmat", "Popt", "Pmega")), scales = "free_y") +
  
  scale_x_discrete(
    labels = c("BM", "S1", "S2", "S3", "S4", "S5")
  ) +
  
  scale_fill_manual(
    values = c(
      "Pmat"  = "#BFD8B8",
      "Popt"  = "skyblue",
      "Pmega" = "beige"
    )
  ) +
  
  ggtitle("Sensitivity Analysis") +
  
  theme_classic(base_family = "serif") +
  
  theme(
    aspect.ratio = 1,   # ← KEEP THIS
    
    plot.title = element_text(
      hjust = 0.5,
      size = 16,
      face = "bold"
    ),
    
    panel.grid.major.y = element_line(
      color = "grey85",
      linewidth = 0.4
    ),
    panel.grid.minor.y = element_line(
      color = "grey90",
      linewidth = 0.2
    ),
    
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    
    axis.text.x = element_text(
      size = 9,
      hjust = 0.5
    ),
    axis.text.y = element_text(size = 9),
    
    axis.title.x = element_text(
      size = 13,
      face = "bold"
    ),
    axis.title.y = element_blank(),
    
    strip.background = element_blank(),
    strip.text = element_text(
      face = "bold",
      size = 11
    )
  ) +
  
  xlab("Scenarios")

ggsave(
  "froese_indicators.pdf",
  plot  = p_froese,
  width = 21,
  height = 10,
  units = "cm",
  device = cairo_pdf
)

plot(p_froese)


 

 

 