install.packages("LBSPR")

library(LBSPR)

MyLengths <- new("LB_lengths")

 

MyPars <- new("LB_pars")

path.expand("~")

MyPars@Species <- "O. bimaculatus"
MyPars@Linf <- 36.32

MyPars@L50 <- 21.02

 

MyPars@L95 <- 23.12

MyPars@MK <- 1.5
 
MyPars@L_units <- "cm"

Len1 <- new("LB_lengths",
            LB_pars = MyPars,
            file = "C:/Users/user/Desktop/Thesis/Mydata/lbSPR/LBSPR1.csv",
            dataType = "freq")
plotSize(Len1)
myFit1 <- LBSPRfit(MyPars, Len1)

myFit1@Ests

dat<-data.frame(rawSL50=myFit1@SL50, rawSL95=myFit1@SL95, rawFM=myFit1@FM, rawSPR=myFit1@SPR)
library(writexl)

write_xlsx(dat, "LBSPR_results.xlsx")

plotSize(myFit1)
plotMat(myFit1)
plotEsts(myFit1)

MyPars <- new("LB_pars", verbose=FALSE)
MyPars@Linf <- 36.32 
MyPars@L50 <- 21.02 
MyPars@L95 <- 23.12
MyPars@MK <- 1.5 
MyPars@SPR <- 0.4 # Target SPR 
MyPars@BinWidth <- 2

yr <- 1 # first year of data

LenDat <- new("LB_lengths", LB_pars=MyPars, file="C:/Users/user/Desktop/Thesis/Mydata/lbSPR/LBSPR1.csv",
              dataType="freq", verbose=FALSE)
Mod <- LBSPRfit(MyPars, LenDat, verbose=FALSE)
yr <- 1 # first year of data
MyPars@SL50 <- Mod@SL50[yr]
MyPars@SL95 <- Mod@SL95[yr]  

plotTarg(MyPars, LenDat, yr=yr)
