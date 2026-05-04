library(aLBI)
library(readxl)
library(dplyr)

df <- read.csv("Length freq new.csv")

FishPar(data = df, resample = 1000, progress = T, Linf = 36.32, Lmat = 21.02 )


FishSS(data = CPdata, Pmat = 65.03133  , Popt =  42.49408 , Pmega =  31.78352, LM_ratio =  0.97 )

