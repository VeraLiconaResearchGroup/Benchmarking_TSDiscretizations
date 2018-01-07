rm(list = ls())
path_org = getwd()
setwd( paste( path_org, 'Delay=4', sep = '/') )

# when choosing threshold == 2, see how the positive and negative values influneces the results
threshold = 2


IdentifedLinks <- function(filename)
{
  re = read.table(file = paste(filename, 'txt', sep = "."), header = FALSE, sep = "")

  names(re) <- c('upperstream', 'downstream', 'score', 'time_delay')
  links <- matrix( rep(0, 100*100), ncol = 100 )
  lnk = links
  n = dim(re)[1] # number of entries
# column as upperstream, row as downstream
  for( i in 1:n )
  {
    co = re[i,1]
    ro = re[i,2]
    lnk[co,ro] = lnk[co,ro] + re[n,3]
  }

  for(i in 1:100){
    for(j in 1:100)
    {
      if( lnk[i,j] == 0 )
      {
        lnk[i,j] = 1000
      }
    }
  }

  ## processing scores into networks
  # when links[i,j] == 1, it suggests gene i is a regulator of gene j
  # when links[i,j] == 1, it suggests gene i is not a regulator of gene j
  for(i in 1:100){
    for(j in 1:100)
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
  
  for(i in 1:100)
  {
    links[i,i] = 0 # it would never be considered as self-regulating
  }
  
  # loading data from the gold standard of yeast 1
  gs = read.table(paste(path_org, 'gsyeast1.txt', sep ='/') , header = FALSE, sep = "")
  
  ## find the correctly identified: 
  corr = gs + links
  corr = ifelse(corr > 1.5, 1,0)
  # corretly identified propertion
  # misidentified
  fp = links - gs
  fp = ifelse(fp>0.1, 1, 0)
  return( list( tp = corr, fp = fp ) )
}

mean = IdentifedLinks('mean')
args = commandArgs(trailingOnly=TRUE)
DiscOFinterest = toString(args)
DISCRETIZATION = IdentifedLinks(DiscOFinterest)

# comparing two network, see whether quantile25 identifies more correct links
diff_tp = DISCRETIZATION$tp - mean$tp
sum(diff_tp)
init = matrix(c(NA, NA), ncol = 2 )
corr_links =init
mis_links = init
k1 = 0
k2 = 0
for(i in 1:100)
{
  for(j in 1:100)
  {
    if(diff_tp[i,j] > 0.5)
    {
      k1 = k1+1
      corr_links = rbind(corr_links, init)
      corr_links[k1,1] = i
      corr_links[k1,2] = j
    }
    else if(diff_tp[i,j] < -0.5)
    {
      k2 = k2+1
      mis_links = rbind(mis_links, init)
      mis_links[k2,1] = i
      mis_links[k2,2] = j
    }
  }
}
print('uniquely correctly identified links, upstream, downstream')
print(corr_links)
print('uniquely misidentified links, upstream, downstream')
print(mis_links)