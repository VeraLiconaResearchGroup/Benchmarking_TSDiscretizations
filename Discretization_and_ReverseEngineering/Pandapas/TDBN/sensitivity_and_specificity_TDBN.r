setwd('~/Dropbox/FallRotation_Yuezhe/Pandapas/wildtype/TDBN/')
#setwd('C:/Users/yuezli/Dropbox/FallRotation_Yuezhe/Pandapas/wildtype/TDBN/')

rm(list = ls())

## processing scores into networks
processingScore <- function(filename, threshold = 0.7147525)
{
	re = read.table(file = paste(filename, 'txt', sep = "."), header = FALSE, sep = "")
	names(re) <- c('upperstream', 'downstream', 'score', 'time_delay')
	nnodes = 13
	
	links <- matrix( rep(0, nnodes*nnodes), ncol = nnodes )
	lnk = links
	n = dim(re)[1] # number of entries
	# column as upperstream, row as downstream
	for( i in 1:n )
	{
		co = re[i,1]
		ro = re[i,2]
		lnk[co,ro] = lnk[co,ro] + re[n,3]
	}

	for(i in 1:nnodes)
	{
		for(j in 1:nnodes)
		{
			if( lnk[i,j] == 0 )
			{
				lnk[i,j] = 1000
			}
		}
	}
	
	#-- print lnk values to choose better cut-off threshold --#
	# print(lnk)
	#-- try not to use this feature when you are running a massive trunk of computation --#
	#-- OR YOUR SCREEN WILL BE FULL OF NUMBERS YOU DO NOT REALLY CARE --#
	
	# when links[i,j] == 1, it suggests gene i is a regulator of gene j
	# when links[i,j] == 1, it suggests gene i is not a regulator of gene j
	for(i in 1:nnodes)
	{
		for(j in 1:nnodes)
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

	for(i in 1:nnodes)
	{
		links[i,i] = 0 # it would never be considered as self-regulating
	}
	

	# loading data from the gold standard of yeast 1
	gs = read.table('gs_wildtype.txt', header = FALSE, sep = "")
	## find the correctly identified: 
	corr = gs + links
	corr = ifelse(corr > 1.5, 1,0)
	# corretly identified propertion
	se = sum(corr)/sum(gs)
	# misidentified
	fp = links - gs
	fp = ifelse(fp>0.1, 1, 0)
	sp = 1- sum(fp)/(nnodes*nnodes - sum(gs))
	#fn = gs - links
	#fn = ifelse(fn > 0.1, 1,0)
	#sum(fn)/sum(gs)
	#sum(fn)/sum(links)
	return(list(sensitivity = se, specificity = sp))
}

allrocs <- function( filename, thresholds )
{
	pts = length(thresholds)
	pse = rep(NA, pts)
	psp = rep(NA, pts)
	pfp = rep(NA, pts)

	for(i in 1:pts)
	{
		p1 = processingScore(filename, threshold = thresholds[i])
		pse[i] = p1$sensitivity
		psp[i] = p1$specificity
	}
	return(list( se = pse, sp = psp ))
}

thresholds = c(0.71476,0.72, 0.81, 0.86, 0.9, 1, 5,6, 13, 32, 34, 40, 200)
roc_names = c('bikmeans2', 'i2', 'kmeans2', 'max25', 'max50', 'max75','mean2', 'q2','TDT','top25','top75') 
sp = matrix(rep(NA, 11*length(thresholds)), ncol = length(thresholds))
se = sp

for(i in 1:11)
{
  sp[i,] = allrocs(roc_names[i], thresholds)$sp
  se[i,] = allrocs(roc_names[i], thresholds)$se
}
rm(i)
# write.table(se, file = '~/Desktop/se.csv', row.names = FALSE, col.names = FALSE, append = FALSE, quote = FALSE, sep = ",")
# write.table(sp, file = '~/Desktop/sp.csv', row.names = FALSE, col.names = FALSE, append = FALSE, quote = FALSE, sep = ",")

