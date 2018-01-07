rm(list=ls())
library(CellNOptR)
library(CNORdt)
#browseVignettes("CNORdt")
setwd("~/Dropbox/FallRotation_Yuezhe/Computation/CSR/")
load("NetworkComparisonAnalysis/errorNov3.RData")
load("NetworkComparisonAnalysis/err_max50.RData")

# compare the difference
NetworkDifference <- function(err_0 = err_0)
{
  oriBSTR = err_0[[1]]$optStr
  err_names <- c('mean', 'bikmeans2', 'TDT', 'i2', 'kmeans2', 'max25', 'max75', 'q2', 'top75', 'top25')
  PKNtable <- read.table("forRembedding/PKN-ExtLiverBMC2012.sif")
  names(PKNtable) <- c('downstream', 'regulation', 'upstream')
  for(i in 1:9)
  {
    optBSTR <- err_0[[i+1]]$optStr
    diff <- optBSTR - oriBSTR
    missed = PKNtable[diff == -1,]
    added = PKNtable[diff == 1,]
    print(err_names[i+1])
    print('missed')
    print(missed)
    print('added')
    print(added)
  }
}

NetworkVisual <- function(err_0 = err_0, filename = 'mean')
{
  # this is to plot different network after optimization
  err_names <- c('mean', 'bikmeans2', 'TDT', 'i2', 'kmeans2', 'max25', 'max75', 'q2', 'top75', 'top25')
  i = 0;
  while( i<length(err_names)+0.1 )
  {
    # if any input string does not belong to the listed discretization, then there will be an error reported by R
    i = i+1
    if(filename == err_names[i] ) break;
  }
  oriBSTR <- err_0[[i]]$optStr
  dis_file <- paste(filename, 'csv', sep = ".")
  dis_file_path <- paste( 'Discretization', dis_file, sep = "/" )
  modelPB=readSIF("forRembedding/PKN-ExtLiverBMC2012.sif")
  dataToy<-readMIDAS(MIDASfile=dis_file_path)
  CNOlistPB<-makeCNOlist(dataset=dataToy,subfield=FALSE)
  model = preprocessing(CNOlistPB, modelPB)
  plotModel(model, CNOlistPB, bString = oriBSTR)
  #bs = mapBack(model, modelPB, oriBSTR)
  #plotModel(modelPB, CNOlistPB, bs, compressed=model$speciesCompressed)
}


NetworkError <- function(err_0 = err_0)
{
  # to get the network errors
  error <- rep(NA, 10)
  names(error) = c('mean', 'bikmeans2', 'TDT', 'i2', 'kmeans2', 'max25', 'max75', 'q2', 'top75', 'top25')
  for(i in 1:10)
  {
    error[i] = err_0[[i]]$error
  }
  return(error)
  fix(error)
}



##
#NetworkDifference(err6)
NetworkVisual(err_0, 'bikmeans2')
## for report purpose ##
