rm(list = ls())
path_org = getwd()
setwd( paste( path_org, 'Delay=4', sep = '/') )

SeSpPR <- function(filename, threshold = 0.7147525, gs)
{
  # this function is design to read in txt file results and process BIC scores for each link from 
  # from all the datasets and time delays
  # this is modified by Y. Li on Dec. 4, 2016
  nodesnum = max(dim(gs)) # size of the network

  re = read.table(file = paste(filename, 'txt', sep = "."), header = FALSE, sep = "")

  names(re) <- c('upperstream', 'downstream', 'score', 'time_delay')
  links <- matrix( rep(0, nodesnum*nodesnum), ncol = nodesnum )
  lnk = links
  n = dim(re)[1] # number of entries
	# column as upperstream, row as downstream
  	for( i in 1:n )
  	{
    	co = re[i,1]
    	ro = re[i,2]
    	lnk[co,ro] = lnk[co,ro] + re[n,3]
  	}

	for(i in 1:nodesnum)
  	{
    	for(j in 1:nodesnum)
    	{
      		if( lnk[i,j] == 0 )
      			{
      				lnk[i,j] = 1000
      			}
    	}
	}
	#-- when need to choose threshold, make the following line not being a comment --#
	# print(lnk)
	#-- end for choosing threshold --#

	# when links[i,j] == 1, it suggests gene i is a regulator of gene j
  	# when links[i,j] == 1, it suggests gene i is not a regulator of gene j
    for(i in 1:nodesnum)
    {
    	for(j in 1:nodesnum)
    	{
      		if( lnk[i,j] < threshold )
      			{
        			links[i,j] = 1
      			}
      		else
      			{
        			links[i,j] = 0
      			}
    	}

  	}
  	for(i in 1:nodesnum) links[i,i] = 0 # it would never be considered as self-regulating

	  ## find the correctly identified: 
  	tp = gs + links
  	tp = ifelse(tp > 1.5, 1,0)
  	# misidentified
  	fp = links - gs
  	fp = ifelse(fp>0.1, 1, 0)
  	fn = gs - links
  	fn = ifelse(fn > 0.1, 1,0)
  	tn = matrix( rep(1, nodesnum*nodesnum), ncol = nodesnum ) - tp -fp - fn
  	# sensitivity = tp/(tp+fn)
  	# specificity = tn/(tn+fp)
  	# precision = tp/(tp+fp)
  	# recall = tp/(tp+fn)
  	precision = sum(tp)/( sum(tp) + sum(fp) )
  	precision = ifelse( is.na(precision), 0, precision )
  	recall = sum(tp)/( sum(tp) + sum(fn) ) # also known as PPV
  	specificity = sum(tn)/( sum(tn) + sum(fp) )
  	sensitivity = sum(tp)/( sum(tp) + sum(fn) )
  	sensitivity = ifelse( is.na(sensitivity), 0, sensitivity )
  	return(list(precision = precision, recall = recall, 
  	            specificity = specificity, sensitivity = sensitivity ))
}

  
# gold standard of yeast 1
gs = read.table(paste(path_org, 'gsyeast1.txt', sep ='/') , header = FALSE, sep = "")
gs = as.matrix(gs)
##-- reading the results process from python screen printing --##
# use this when using the bash script or run from terminal 
args = commandArgs(trailingOnly=TRUE)
DiscOFinterest = toString(args)
# otherwise change the input from here
#filename = 'mean'
#filename = 'bikmeans'
#filename = 'gallo'
#filename = 'kmeans'
#filename = 'quantile25'
#filename = 'quantile75'
#filename = 'q2'
#filename = 'i2'
#filename = 'max25'
#filename = 'max75'
#filename = 'max50'

##-- ROC curves and AUROC calculation --##
thresholds = c(0.7147,0.72, 0.81, 0.86, 0.9, 1, 2,3,4,5,6)
# threshold chosen by checking lnk (!! line 37 !!)
pts = length(thresholds)
pse = rep(NA, pts)
psp = rep(NA, pts)
pfp = rep(NA, pts)
for(i in 1:pts)
{
  p1 = SeSpPR(filename, threshold = thresholds[i], gs)
  pse[i] = p1$sensitivity
  psp[i] = p1$specificity
  pfp[i] = 1-psp[i]
  rm(p1)
}
#-- ROC Curve --##
xy = pfp
y = c(0,pse[order(xy)],1)
x = c(0,pfp[order(xy)],1)
# dev.new()
plot(x, y, main = paste( 'ROC curve for TDBN', filename, sep = ", " ), xlim = range(0,1), ylim = range(0,1),ylab = 'true positive rate', xlab = 'false positive rate',asp = 1, type = 'b')
rm(xy)
##-- AUROC --##
area = 0
for(i in 1:(pts+1))
{
  s = y[i] + y[i+1]
  h = x[i+1] - x[i]
  area = area + s*h/2
  rm(s,h)
}
print(area)
rm(x, y, pts, pse, psp, pfp, thresholds)

##---- AREA UNDER THE CURVE FOR DIFFERENT DISCRETIZATION METHODS ----##
# mean = 0.5084622
# bikmeans = 0.477617
# gallo(TDT) = 0.5147641
# kmeans = 0.4778871
# quantile25 = 0.5166554
# quantile75 = 0.4680816
# q2 = 0.4726612
# i2 = 0.4582999
# max25 = 0.5026408
# max50 = 0.4843891
# max75 = 0.5123407

##-- processing scores into networks to precision-recall curve --##
# checking AUPR as a control for the TDBN in DREAM3 data
# only for a reference value
# only mean discretization because it is referred in the paper:  
# Li, Peng, et al. "Gene regulatory network inference and validation using relative change ratio analysis and time-delayed dynamic Bayesian network." EURASIP Journal on Bioinformatics and Systems Biology 2014.1 (2014): 1.

thresholds = c(0.81,0, 1, 2,3)
pts = length(thresholds)
pr = rep(NA, pts)
re = rep(NA, pts)
for(i in 1:pts)
{
  p1 = SeSpPR(filename = 'mean', threshold = thresholds[i], gs = as.matrix(read.table( paste(path_org, 'gsyeast1.txt', sep ='/') , header = FALSE, sep = "")))
  pr[i] = p1$precision
  re[i] = p1$recall
  rm(p1)
}

# plot precision-recall curve
re = re[order(re)]
pr = c(1,pr[order(re)],0)
re = c(0,re,1)
# AUPR
area = 0
for(i in 1:(pts+1))
{
  s = pr[i] + pr[i+1]
  h = re[i+1] - re[i]
  area = area + s*h/2
}
print('AUPR for mean discretization')
print(area)

