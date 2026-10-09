library(aLBI)
library(readxl)
library(dplyr)

df <- read.csv("aLBI Data.csv")

fishpar <- FishPar(data = df,
                   resample = 1000,
                   progress = T
                   , Linf = 30.87
                   #, Lmat = 17.87
                   )


FishSS(data = CPdata,
       Pmat = 83.43460,
       Popt =  25.65496 ,
       Pmega =  66.02197 ,
       LM_ratio =  0.98)

