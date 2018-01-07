rm(list = ls())
setwd( getwd() )

args = commandArgs(trailingOnly=TRUE)
DiscOFinterest = toString(args)

fname = paste( DiscOFinterest, 'csv', sep = '.' )
dpath = paste('DiscData', fname, sep = '/')

alldata = read.csv( dpath , header = FALSE)
for(i in 1:46)
{
  st = (i-1)*100 + 1
  ed = i*100
  data = alldata[st:ed, 1:21]
  data = data + matrix(rep(1, 100*21), ncol = 21)
  filename = paste('y', i, sep = "")
  filename = paste(filename, 'txt', sep = ".")
  write.table(data, file = filename,  append = FALSE, quote = FALSE, sep = " ",
              eol = "\n", na = "NA", row.names = FALSE,
              col.names = FALSE)
  rm(filename, st, ed, data)
}
