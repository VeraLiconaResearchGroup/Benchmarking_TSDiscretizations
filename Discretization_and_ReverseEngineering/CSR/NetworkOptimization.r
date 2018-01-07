rm(list=ls())
#graphics.off()

setwd("~/Dropbox/FallRotation_Yuezhe/Computation/CSR")

library(CellNOptR)
library(CNORdt)

PaperReproduce <- function(filename = 'mean', lowerB, upperB, boolUpdates=50, maxTime=500)
{
  # optimization section
  dis_file <- paste(filename, 'csv', sep = ".")
  dis_file_path <- paste( 'Discretization', dis_file, sep = "/" )
  modelPB=readSIF("forRembedding/PKN-ExtLiverBMC2012.sif")
  dataToy<-readMIDAS(MIDASfile=dis_file_path)
  CNOlistPB<-makeCNOlist(dataset=dataToy,subfield=FALSE)
  model = preprocessing(CNOlistPB, modelPB)
  optstring <- rep(0, as.integer(length(model$reacID)))
  opt1 <- gaBinaryDT(CNOlist=CNOlistPB, model=model, verbose=FALSE, 
                     boolUpdates=boolUpdates, maxTime=maxTime, lowerB=lowerB, upperB=upperB )
  optStr <- opt1$bString #*** what is needed for simulation/ error calculaiton***#
#  rm(dis_file, dis_file_path, CNOlistPB, model, optstring, opt1)
  #-- simulation for error/ score calculation --#
  PaperData<-readMIDAS(MIDASfile="forRembedding/PKN-ExtLiverBMC2012.csv")
  CNOlistPaper<-makeCNOlist(dataset=PaperData,subfield=FALSE)
  modelPaper = preprocessing(CNOlistPaper, modelPB) # modelPB is the same for optimization and simulation
  error <- computeScoreDT(CNOlist=CNOlistPaper, model=modelPaper, bString = optStr,  
                 sizeFac=0, NAFac=0, boolUpdates = 100, lowerB=lowerB, upperB=upperB)
  print(filename)
  print(error)
  return( list(error = error, optStr = optStr) )
}

Alltethered <- function(lowerB, upperB, boolUpdates=50, maxTime=1000)
{
  # this is only to see how optimization results influences the data
  # paper error as a reference
  err_mean = PaperReproduce('mean', lowerB, upperB) 
  # other discretization method
  err_bikmeans2 = PaperReproduce('bikmeans2', lowerB, upperB) 
  err_TDT = PaperReproduce('TDT', lowerB, upperB) 
  err_i2 = PaperReproduce('i2', lowerB, upperB) 
  err_kmeans2 = PaperReproduce('kmeans2', lowerB, upperB) 
  err_max25 = PaperReproduce('max25', lowerB, upperB) 
  err_max75 = PaperReproduce('max75', lowerB, upperB) 
  err_q2 = PaperReproduce('q2', lowerB, upperB) 
  err_top75 = PaperReproduce('top75', lowerB, upperB) 
  err_top25 = PaperReproduce('top25', lowerB, upperB)
  err = list( err_mean, err_bikmeans2, err_TDT, err_i2, err_kmeans2, err_max25, 
              err_max75, err_q2, err_top75, err_top25 )
}

# reproduce some values mentioned in the paper as "sufficient"
# added on Nov.8 
max_50_1 <- PaperReproduce('max50', 0.1,10)
max_50_2 <- PaperReproduce('max50', 0.01,0.1)
max_50_3 <- PaperReproduce('max50', 0.001,0.01)
max_50_4 <- PaperReproduce('max50', 1, 100.1)
max_50_5 <- PaperReproduce('max50', 0.001, 0.1)
max_50_6 <- PaperReproduce('max50', 0.01, 10)
save.image("~/Dropbox/FallRotation_Yuezhe/CSR/NetworkComparisonAnalysis/err_max50.RData")

##-- default value --##
# err_0 = Alltethered(lowerB=0.1, upperB=10)
##-- my other tests --##
# err1 = Alltethered(lowerB=0.1, upperB=1)
# err2 = Alltethered(lowerB=0.01, upperB=0.1)
# err3 = Alltethered(lowerB=0.001, upperB=0.01)
# err4 = Alltethered(lowerB=1, upperB=100.1)
# err5 = Alltethered(lowerB=0.001, upperB=0.1)
# err6 = Alltethered(lowerB=0.01, upperB=10)

# save.image("~/Dropbox/FallRotation_Yuezhe/CSR/NetworkComparisonAnalysis/err.RData")




