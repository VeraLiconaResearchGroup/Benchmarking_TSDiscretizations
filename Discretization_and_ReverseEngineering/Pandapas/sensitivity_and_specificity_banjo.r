rm(list = ls())

SeSp <- function(gold, infer)
{
  # find false positive
  fp = infer - gold
  fp = ifelse( fp>0.5, 1,0  )
  # find true positive
  tp = gold*infer
  # false negative
  fn = infer - gold
  fn = ifelse( fn<-0.5, 1, 0 )
  # true negative
  tn1 = matrix( rep(1, 13*13), ncol = 1 ) - gold
  tn2 = matrix( rep(1, 13*13), ncol = 1 ) - infer
  tn = tn1*tn2
  # sensitivity, specificity, precision, and recall
  sensitivity = sum(tp)/( sum(tp) + sum(fn) )
  specificity = sum(tn)/( sum(tn) + sum(fp) )
  precision = sum(tp)/( sum(tp) + sum(fp) )
  recall = sum(tp)/( sum(tp) + sum(fn) )
  return(list(se = sensitivity, sp = specificity))
}

# change the path if needed!!!!!
setwd('~/Dropbox/FallRotation_Yuezhe/Pandapas/wildtype/')

gs = read.table('gs_wildtype.txt', header = FALSE, sep = "")

one.bikmeans2 = read.table('wt_consensus_banjo/1.bikmeans2.txt', header = FALSE, sep = "")
one.i2 = read.table('wt_consensus_banjo/1.i2.txt', header = FALSE, sep = "")
one.kmeans2 = read.table('wt_consensus_banjo/1.kmeans2.txt', header = FALSE, sep = "")
one.max25 = read.table('wt_consensus_banjo/1.max25.txt', header = FALSE, sep = "")
one.max50 = read.table('wt_consensus_banjo/1.max50.txt', header = FALSE, sep = "")
one.max75 = read.table('wt_consensus_banjo/1.max75.txt', header = FALSE, sep = "")
one.mean2 = read.table('wt_consensus_banjo/1.mean2.txt', header = FALSE, sep = "")
one.q2 = read.table('wt_consensus_banjo/1.q2.txt', header = FALSE, sep = "")
one.TDT = read.table('wt_consensus_banjo/1.TDT.txt', header = FALSE, sep = "")
one.top75 = read.table('wt_consensus_banjo/1.top75.txt', header = FALSE, sep = "")
one.top25 = read.table('wt_consensus_banjo/1.top25.txt', header = FALSE, sep = "")

two.bikmeans2 = read.table('wt_consensus_banjo/2.bikmeans2.txt', header = FALSE, sep = "")
two.i2 = read.table('wt_consensus_banjo/2.i2.txt', header = FALSE, sep = "")
two.kmeans2 = read.table('wt_consensus_banjo/2.kmeans2.txt', header = FALSE, sep = "")
two.max25 = read.table('wt_consensus_banjo/2.max25.txt', header = FALSE, sep = "")
two.max50 = read.table('wt_consensus_banjo/2.max50.txt', header = FALSE, sep = "")
two.max75 = read.table('wt_consensus_banjo/2.max75.txt', header = FALSE, sep = "")
two.mean2 = read.table('wt_consensus_banjo/2.mean2.txt', header = FALSE, sep = "")
two.q2 = read.table('wt_consensus_banjo/2.q2.txt', header = FALSE, sep = "")
two.TDT = read.table('wt_consensus_banjo/2.TDT.txt', header = FALSE, sep = "")
two.top75 = read.table('wt_consensus_banjo/2.top75.txt', header = FALSE, sep = "")
two.top25 = read.table('wt_consensus_banjo/2.top25.txt', header = FALSE, sep = "")

three.bikmeans2 = read.table('wt_consensus_banjo/3.bikmeans2.txt', header = FALSE, sep = "")
three.i2 = read.table('wt_consensus_banjo/3.i2.txt', header = FALSE, sep = "")
three.kmeans2 = read.table('wt_consensus_banjo/3.kmeans2.txt', header = FALSE, sep = "")
three.max25 = read.table('wt_consensus_banjo/3.max25.txt', header = FALSE, sep = "")
three.max50 = read.table('wt_consensus_banjo/3.max50.txt', header = FALSE, sep = "")
three.max75 = read.table('wt_consensus_banjo/3.max75.txt', header = FALSE, sep = "")
three.mean2 = read.table('wt_consensus_banjo/3.mean2.txt', header = FALSE, sep = "")
three.q2 = read.table('wt_consensus_banjo/3.q2.txt', header = FALSE, sep = "")
three.TDT = read.table('wt_consensus_banjo/3.TDT.txt', header = FALSE, sep = "")
three.top75 = read.table('wt_consensus_banjo/3.top75.txt', header = FALSE, sep = "")
three.top25 = read.table('wt_consensus_banjo/3.top25.txt', header = FALSE, sep = "")

four.bikmeans2 = read.table('wt_consensus_banjo/4.bikmeans2.txt', header = FALSE, sep = "")
four.i2 = read.table('wt_consensus_banjo/4.i2.txt', header = FALSE, sep = "")
four.kmeans2 = read.table('wt_consensus_banjo/4.kmeans2.txt', header = FALSE, sep = "")
four.max25 = read.table('wt_consensus_banjo/4.max25.txt', header = FALSE, sep = "")
four.max50 = read.table('wt_consensus_banjo/4.max50.txt', header = FALSE, sep = "")
four.max75 = read.table('wt_consensus_banjo/4.max75.txt', header = FALSE, sep = "")
four.mean2 = read.table('wt_consensus_banjo/4.mean2.txt', header = FALSE, sep = "")
four.q2 = read.table('wt_consensus_banjo/4.q2.txt', header = FALSE, sep = "")
four.TDT = read.table('wt_consensus_banjo/4.TDT.txt', header = FALSE, sep = "")
four.top75 = read.table('wt_consensus_banjo/4.top75.txt', header = FALSE, sep = "")
four.top25 = read.table('wt_consensus_banjo/4.top25.txt', header = FALSE, sep = "")

five.bikmeans2 = read.table('wt_consensus_banjo/5.bikmeans2.txt', header = FALSE, sep = "")
five.i2 = read.table('wt_consensus_banjo/5.i2.txt', header = FALSE, sep = "")
five.kmeans2 = read.table('wt_consensus_banjo/5.kmeans2.txt', header = FALSE, sep = "")
five.max25 = read.table('wt_consensus_banjo/5.max25.txt', header = FALSE, sep = "")
five.max50 = read.table('wt_consensus_banjo/5.max50.txt', header = FALSE, sep = "")
five.max75 = read.table('wt_consensus_banjo/5.max75.txt', header = FALSE, sep = "")
five.mean2 = read.table('wt_consensus_banjo/5.mean2.txt', header = FALSE, sep = "")
five.q2 = read.table('wt_consensus_banjo/5.q2.txt', header = FALSE, sep = "")
five.TDT = read.table('wt_consensus_banjo/5.TDT.txt', header = FALSE, sep = "")
five.top75 = read.table('wt_consensus_banjo/5.top75.txt', header = FALSE, sep = "")
five.top25 = read.table('wt_consensus_banjo/5.top25.txt', header = FALSE, sep = "")

six.bikmeans2 = read.table('wt_consensus_banjo/6.bikmeans2.txt', header = FALSE, sep = "")
six.i2 = read.table('wt_consensus_banjo/6.i2.txt', header = FALSE, sep = "")
six.kmeans2 = read.table('wt_consensus_banjo/6.kmeans2.txt', header = FALSE, sep = "")
six.max25 = read.table('wt_consensus_banjo/6.max25.txt', header = FALSE, sep = "")
six.max50 = read.table('wt_consensus_banjo/6.max50.txt', header = FALSE, sep = "")
six.max75 = read.table('wt_consensus_banjo/6.max75.txt', header = FALSE, sep = "")
six.mean2 = read.table('wt_consensus_banjo/6.mean2.txt', header = FALSE, sep = "")
six.q2 = read.table('wt_consensus_banjo/6.q2.txt', header = FALSE, sep = "")
six.TDT = read.table('wt_consensus_banjo/6.TDT.txt', header = FALSE, sep = "")
six.top75 = read.table('wt_consensus_banjo/6.top75.txt', header = FALSE, sep = "")
six.top25 = read.table('wt_consensus_banjo/6.top25.txt', header = FALSE, sep = "")

seven.bikmeans2 = read.table('wt_consensus_banjo/7.bikmeans2.txt', header = FALSE, sep = "")
seven.i2 = read.table('wt_consensus_banjo/7.i2.txt', header = FALSE, sep = "")
seven.kmeans2 = read.table('wt_consensus_banjo/7.kmeans2.txt', header = FALSE, sep = "")
seven.max25 = read.table('wt_consensus_banjo/7.max25.txt', header = FALSE, sep = "")
seven.max50 = read.table('wt_consensus_banjo/7.max50.txt', header = FALSE, sep = "")
seven.max75 = read.table('wt_consensus_banjo/7.max75.txt', header = FALSE, sep = "")
seven.mean2 = read.table('wt_consensus_banjo/7.mean2.txt', header = FALSE, sep = "")
seven.q2 = read.table('wt_consensus_banjo/7.q2.txt', header = FALSE, sep = "")
seven.TDT = read.table('wt_consensus_banjo/7.TDT.txt', header = FALSE, sep = "")
seven.top75 = read.table('wt_consensus_banjo/7.top75.txt', header = FALSE, sep = "")
seven.top25 = read.table('wt_consensus_banjo/7.top25.txt', header = FALSE, sep = "")

eight.bikmeans2 = read.table('wt_consensus_banjo/8.bikmeans2.txt', header = FALSE, sep = "")
eight.i2 = read.table('wt_consensus_banjo/8.i2.txt', header = FALSE, sep = "")
eight.kmeans2 = read.table('wt_consensus_banjo/8.kmeans2.txt', header = FALSE, sep = "")
eight.max25 = read.table('wt_consensus_banjo/8.max25.txt', header = FALSE, sep = "")
eight.max50 = read.table('wt_consensus_banjo/8.max50.txt', header = FALSE, sep = "")
eight.max75 = read.table('wt_consensus_banjo/8.max75.txt', header = FALSE, sep = "")
eight.mean2 = read.table('wt_consensus_banjo/8.mean2.txt', header = FALSE, sep = "")
eight.q2 = read.table('wt_consensus_banjo/8.q2.txt', header = FALSE, sep = "")
eight.TDT = read.table('wt_consensus_banjo/8.TDT.txt', header = FALSE, sep = "")
eight.top75 = read.table('wt_consensus_banjo/8.top75.txt', header = FALSE, sep = "")
eight.top25 = read.table('wt_consensus_banjo/8.top25.txt', header = FALSE, sep = "")

nine.bikmeans2 = read.table('wt_consensus_banjo/9.bikmeans2.txt', header = FALSE, sep = "")
nine.i2 = read.table('wt_consensus_banjo/9.i2.txt', header = FALSE, sep = "")
nine.kmeans2 = read.table('wt_consensus_banjo/9.kmeans2.txt', header = FALSE, sep = "")
nine.max25 = read.table('wt_consensus_banjo/9.max25.txt', header = FALSE, sep = "")
nine.max50 = read.table('wt_consensus_banjo/9.max50.txt', header = FALSE, sep = "")
nine.max75 = read.table('wt_consensus_banjo/9.max75.txt', header = FALSE, sep = "")
nine.mean2 = read.table('wt_consensus_banjo/9.mean2.txt', header = FALSE, sep = "")
nine.q2 = read.table('wt_consensus_banjo/9.q2.txt', header = FALSE, sep = "")
nine.TDT = read.table('wt_consensus_banjo/9.TDT.txt', header = FALSE, sep = "")
nine.top75 = read.table('wt_consensus_banjo/9.top75.txt', header = FALSE, sep = "")
nine.top25 = read.table('wt_consensus_banjo/9.top25.txt', header = FALSE, sep = "")

roc_se = matrix( rep(NA, 9*11), ncol = 9 )
roc_sp = matrix( rep(NA, 9*11), ncol = 9 )


#-- roc data calculation & compile together --#

roc_se[1,1] = SeSp(gs, one.bikmeans2)$se
roc_se[1,2] = SeSp(gs, two.bikmeans2)$se
roc_se[1,3] = SeSp(gs, three.bikmeans2)$se
roc_se[1,4] = SeSp(gs, four.bikmeans2)$se
roc_se[1,5] = SeSp(gs, five.bikmeans2)$se
roc_se[1,6] = SeSp(gs, six.bikmeans2)$se
roc_se[1,7] = SeSp(gs, seven.bikmeans2)$se
roc_se[1,8] = SeSp(gs, eight.bikmeans2)$se
roc_se[1,9] = SeSp(gs, nine.bikmeans2)$se

roc_sp[1,1] = SeSp(gs, one.bikmeans2)$sp
roc_sp[1,2] = SeSp(gs, two.bikmeans2)$sp
roc_sp[1,3] = SeSp(gs, three.bikmeans2)$sp
roc_sp[1,4] = SeSp(gs, four.bikmeans2)$sp
roc_sp[1,5] = SeSp(gs, five.bikmeans2)$sp
roc_sp[1,6] = SeSp(gs, six.bikmeans2)$sp
roc_sp[1,7] = SeSp(gs, seven.bikmeans2)$sp
roc_sp[1,8] = SeSp(gs, eight.bikmeans2)$sp
roc_sp[1,9] = SeSp(gs, nine.bikmeans2)$sp

roc_se[2,1] = SeSp(gs, one.i2)$se
roc_se[2,2] = SeSp(gs, two.i2)$se
roc_se[2,3] = SeSp(gs, three.i2)$se
roc_se[2,4] = SeSp(gs, four.i2)$se
roc_se[2,5] = SeSp(gs, five.i2)$se
roc_se[2,6] = SeSp(gs, six.i2)$se
roc_se[2,7] = SeSp(gs, seven.i2)$se
roc_se[2,8] = SeSp(gs, eight.i2)$se
roc_se[2,9] = SeSp(gs, nine.i2)$se

roc_sp[2,1] = SeSp(gs, one.i2)$sp
roc_sp[2,2] = SeSp(gs, two.i2)$sp
roc_sp[2,3] = SeSp(gs, three.i2)$sp
roc_sp[2,4] = SeSp(gs, four.i2)$sp
roc_sp[2,5] = SeSp(gs, five.i2)$sp
roc_sp[2,6] = SeSp(gs, six.i2)$sp
roc_sp[2,7] = SeSp(gs, seven.i2)$sp
roc_sp[2,8] = SeSp(gs, eight.i2)$sp
roc_sp[2,9] = SeSp(gs, nine.i2)$sp

roc_se[3,1] = SeSp(gs, one.kmeans2)$se
roc_se[3,2] = SeSp(gs, two.kmeans2)$se
roc_se[3,3] = SeSp(gs, three.kmeans2)$se
roc_se[3,4] = SeSp(gs, four.kmeans2)$se
roc_se[3,5] = SeSp(gs, five.kmeans2)$se
roc_se[3,6] = SeSp(gs, six.kmeans2)$se
roc_se[3,7] = SeSp(gs, seven.kmeans2)$se
roc_se[3,8] = SeSp(gs, eight.kmeans2)$se
roc_se[3,9] = SeSp(gs, nine.kmeans2)$se

roc_sp[3,1] = SeSp(gs, one.kmeans2)$sp
roc_sp[3,2] = SeSp(gs, two.kmeans2)$sp
roc_sp[3,3] = SeSp(gs, three.kmeans2)$sp
roc_sp[3,4] = SeSp(gs, four.kmeans2)$sp
roc_sp[3,5] = SeSp(gs, five.kmeans2)$sp
roc_sp[3,6] = SeSp(gs, six.kmeans2)$sp
roc_sp[3,7] = SeSp(gs, seven.kmeans2)$sp
roc_sp[3,8] = SeSp(gs, eight.kmeans2)$sp
roc_sp[3,9] = SeSp(gs, nine.kmeans2)$sp

roc_se[4,1] = SeSp(gs, one.max25)$se
roc_se[4,2] = SeSp(gs, two.max25)$se
roc_se[4,3] = SeSp(gs, three.max25)$se
roc_se[4,4] = SeSp(gs, four.max25)$se
roc_se[4,5] = SeSp(gs, five.max25)$se
roc_se[4,6] = SeSp(gs, six.max25)$se
roc_se[4,7] = SeSp(gs, seven.max25)$se
roc_se[4,8] = SeSp(gs, eight.max25)$se
roc_se[4,9] = SeSp(gs, nine.max25)$se

roc_sp[4,1] = SeSp(gs, one.max25)$sp
roc_sp[4,2] = SeSp(gs, two.max25)$sp
roc_sp[4,3] = SeSp(gs, three.max25)$sp
roc_sp[4,4] = SeSp(gs, four.max25)$sp
roc_sp[4,5] = SeSp(gs, five.max25)$sp
roc_sp[4,6] = SeSp(gs, six.max25)$sp
roc_sp[4,7] = SeSp(gs, seven.max25)$sp
roc_sp[4,8] = SeSp(gs, eight.max25)$sp
roc_sp[4,9] = SeSp(gs, nine.max25)$sp

roc_se[5,1] = SeSp(gs, one.max50)$se
roc_se[5,2] = SeSp(gs, two.max50)$se
roc_se[5,3] = SeSp(gs, three.max50)$se
roc_se[5,4] = SeSp(gs, four.max50)$se
roc_se[5,5] = SeSp(gs, five.max50)$se
roc_se[5,6] = SeSp(gs, six.max50)$se
roc_se[5,7] = SeSp(gs, seven.max50)$se
roc_se[5,8] = SeSp(gs, eight.max50)$se
roc_se[5,9] = SeSp(gs, nine.max50)$se

roc_sp[5,1] = SeSp(gs, one.max50)$sp
roc_sp[5,2] = SeSp(gs, two.max50)$sp
roc_sp[5,3] = SeSp(gs, three.max50)$sp
roc_sp[5,4] = SeSp(gs, four.max50)$sp
roc_sp[5,5] = SeSp(gs, five.max50)$sp
roc_sp[5,6] = SeSp(gs, six.max50)$sp
roc_sp[5,7] = SeSp(gs, seven.max50)$sp
roc_sp[5,8] = SeSp(gs, eight.max50)$sp
roc_sp[5,9] = SeSp(gs, nine.max50)$sp

roc_se[6,1] = SeSp(gs, one.max75)$se
roc_se[6,2] = SeSp(gs, two.max75)$se
roc_se[6,3] = SeSp(gs, three.max75)$se
roc_se[6,4] = SeSp(gs, four.max75)$se
roc_se[6,5] = SeSp(gs, five.max75)$se
roc_se[6,6] = SeSp(gs, six.max75)$se
roc_se[6,7] = SeSp(gs, seven.max75)$se
roc_se[6,8] = SeSp(gs, eight.max75)$se
roc_se[6,9] = SeSp(gs, nine.max75)$se

roc_sp[6,1] = SeSp(gs, one.max75)$sp
roc_sp[6,2] = SeSp(gs, two.max75)$sp
roc_sp[6,3] = SeSp(gs, three.max75)$sp
roc_sp[6,4] = SeSp(gs, four.max75)$sp
roc_sp[6,5] = SeSp(gs, five.max75)$sp
roc_sp[6,6] = SeSp(gs, six.max75)$sp
roc_sp[6,7] = SeSp(gs, seven.max75)$sp
roc_sp[6,8] = SeSp(gs, eight.max75)$sp
roc_sp[6,9] = SeSp(gs, nine.max75)$sp

roc_se[7,1] = SeSp(gs, one.mean2)$se
roc_se[7,2] = SeSp(gs, two.mean2)$se
roc_se[7,3] = SeSp(gs, three.mean2)$se
roc_se[7,4] = SeSp(gs, four.mean2)$se
roc_se[7,5] = SeSp(gs, five.mean2)$se
roc_se[7,6] = SeSp(gs, six.mean2)$se
roc_se[7,7] = SeSp(gs, seven.mean2)$se
roc_se[7,8] = SeSp(gs, eight.mean2)$se
roc_se[7,9] = SeSp(gs, nine.mean2)$se

roc_sp[7,1] = SeSp(gs, one.mean2)$sp
roc_sp[7,2] = SeSp(gs, two.mean2)$sp
roc_sp[7,3] = SeSp(gs, three.mean2)$sp
roc_sp[7,4] = SeSp(gs, four.mean2)$sp
roc_sp[7,5] = SeSp(gs, five.mean2)$sp
roc_sp[7,6] = SeSp(gs, six.mean2)$sp
roc_sp[7,7] = SeSp(gs, seven.mean2)$sp
roc_sp[7,8] = SeSp(gs, eight.mean2)$sp
roc_sp[7,9] = SeSp(gs, nine.mean2)$sp

roc_se[8,1] = SeSp(gs, one.q2)$se
roc_se[8,2] = SeSp(gs, two.q2)$se
roc_se[8,3] = SeSp(gs, three.q2)$se
roc_se[8,4] = SeSp(gs, four.q2)$se
roc_se[8,5] = SeSp(gs, five.q2)$se
roc_se[8,6] = SeSp(gs, six.q2)$se
roc_se[8,7] = SeSp(gs, seven.q2)$se
roc_se[8,8] = SeSp(gs, eight.q2)$se
roc_se[8,9] = SeSp(gs, nine.q2)$se

roc_sp[8,1] = SeSp(gs, one.q2)$sp
roc_sp[8,2] = SeSp(gs, two.q2)$sp
roc_sp[8,3] = SeSp(gs, three.q2)$sp
roc_sp[8,4] = SeSp(gs, four.q2)$sp
roc_sp[8,5] = SeSp(gs, five.q2)$sp
roc_sp[8,6] = SeSp(gs, six.q2)$sp
roc_sp[8,7] = SeSp(gs, seven.q2)$sp
roc_sp[8,8] = SeSp(gs, eight.q2)$sp
roc_sp[8,9] = SeSp(gs, nine.q2)$sp

roc_se[9,1] = SeSp(gs, one.TDT)$se
roc_se[9,2] = SeSp(gs, two.TDT)$se
roc_se[9,3] = SeSp(gs, three.TDT)$se
roc_se[9,4] = SeSp(gs, four.TDT)$se
roc_se[9,5] = SeSp(gs, five.TDT)$se
roc_se[9,6] = SeSp(gs, six.TDT)$se
roc_se[9,7] = SeSp(gs, seven.TDT)$se
roc_se[9,8] = SeSp(gs, eight.TDT)$se
roc_se[9,9] = SeSp(gs, nine.TDT)$se

roc_sp[9,1] = SeSp(gs, one.TDT)$sp
roc_sp[9,2] = SeSp(gs, two.TDT)$sp
roc_sp[9,3] = SeSp(gs, three.TDT)$sp
roc_sp[9,4] = SeSp(gs, four.TDT)$sp
roc_sp[9,5] = SeSp(gs, five.TDT)$sp
roc_sp[9,6] = SeSp(gs, six.TDT)$sp
roc_sp[9,7] = SeSp(gs, seven.TDT)$sp
roc_sp[9,8] = SeSp(gs, eight.TDT)$sp
roc_sp[9,9] = SeSp(gs, nine.TDT)$sp

roc_se[10,1] = SeSp(gs, one.top25)$se
roc_se[10,2] = SeSp(gs, two.top25)$se
roc_se[10,3] = SeSp(gs, three.top25)$se
roc_se[10,4] = SeSp(gs, four.top25)$se
roc_se[10,5] = SeSp(gs, five.top25)$se
roc_se[10,6] = SeSp(gs, six.top25)$se
roc_se[10,7] = SeSp(gs, seven.top25)$se
roc_se[10,8] = SeSp(gs, eight.top25)$se
roc_se[10,9] = SeSp(gs, nine.top25)$se

roc_sp[10,1] = SeSp(gs, one.top25)$sp
roc_sp[10,2] = SeSp(gs, two.top25)$sp
roc_sp[10,3] = SeSp(gs, three.top25)$sp
roc_sp[10,4] = SeSp(gs, four.top25)$sp
roc_sp[10,5] = SeSp(gs, five.top25)$sp
roc_sp[10,6] = SeSp(gs, six.top25)$sp
roc_sp[10,7] = SeSp(gs, seven.top25)$sp
roc_sp[10,8] = SeSp(gs, eight.top25)$sp
roc_sp[10,9] = SeSp(gs, nine.top25)$sp

roc_se[11,1] = SeSp(gs, one.top75)$se
roc_se[11,2] = SeSp(gs, two.top75)$se
roc_se[11,3] = SeSp(gs, three.top75)$se
roc_se[11,4] = SeSp(gs, four.top75)$se
roc_se[11,5] = SeSp(gs, five.top75)$se
roc_se[11,6] = SeSp(gs, six.top75)$se
roc_se[11,7] = SeSp(gs, seven.top75)$se
roc_se[11,8] = SeSp(gs, eight.top75)$se
roc_se[11,9] = SeSp(gs, nine.top75)$se

roc_sp[11,1] = SeSp(gs, one.top75)$sp
roc_sp[11,2] = SeSp(gs, two.top75)$sp
roc_sp[11,3] = SeSp(gs, three.top75)$sp
roc_sp[11,4] = SeSp(gs, four.top75)$sp
roc_sp[11,5] = SeSp(gs, five.top75)$sp
roc_sp[11,6] = SeSp(gs, six.top75)$sp
roc_sp[11,7] = SeSp(gs, seven.top75)$sp
roc_sp[11,8] = SeSp(gs, eight.top75)$sp
roc_sp[11,9] = SeSp(gs, nine.top75)$sp


#-- plot roc curves --#
roc_names = c('bikmeans2', 'i2', 'kmeans2', 'max25', 'max50', 'max75','mean', 'q2','TDT','top25','top75') 

#-- AUROC --#

auroc <- function(sp, se)
{
  # both se and sp should be a row vector
  k = length(sp)
  spp = rep(1,k) - sp
  sppp = spp
  tp = se[sort.list(sppp, decreasing = FALSE)]
  fp = spp[sort.list(sppp, decreasing = FALSE)]
  tp = c(0,tp,1)
  fp = c(0,fp,1)
  k = k+1
  area = 0
  for( j in 1:k )
  {
    auro = (fp[j+1] - fp[j]) * ( tp[k+1]+tp[k] )/2
    area = area + auro
    rm(auro)
  }
  # plot(fp, tp)
  return(area)
}

# aUrocBanJowT = rep(NA, 11)
# for( i in 1:11 ) aUrocBanJowT[i] = auroc(roc_sp[i,], roc_se[i,])
# print(aUrocBanJowT)

# write.table(roc_se, file = '~/Desktop/se.csv', sep = ',', col.names = FALSE, row.names = FALSE)
# write.table(roc_sp, file = '~/Desktop/sp.csv', sep = ',', col.names = FALSE, row.names = FALSE)

##-- multi-level discretization --##
# cannot be referenced by TDBN
# demanded by Dr. M.P. V-L on Dec.2 

one.bikmeans3 = read.table('wt_consensus_banjo/1.bikmeans3.txt', header = FALSE, sep = "")
one.i3 = read.table('wt_consensus_banjo/1.i3.txt', header = FALSE, sep = "")
one.kmeans3 = read.table('wt_consensus_banjo/1.kmeans3.txt', header = FALSE, sep = "")
one.q3 = read.table('wt_consensus_banjo/1.q3.txt', header = FALSE, sep = "")
two.bikmeans3 = read.table('wt_consensus_banjo/2.bikmeans3.txt', header = FALSE, sep = "")
two.i3 = read.table('wt_consensus_banjo/2.i3.txt', header = FALSE, sep = "")
two.kmeans3 = read.table('wt_consensus_banjo/2.kmeans3.txt', header = FALSE, sep = "")
two.q3 = read.table('wt_consensus_banjo/2.q3.txt', header = FALSE, sep = "")
three.bikmeans3 = read.table('wt_consensus_banjo/3.bikmeans3.txt', header = FALSE, sep = "")
three.i3 = read.table('wt_consensus_banjo/3.i3.txt', header = FALSE, sep = "")
three.kmeans3 = read.table('wt_consensus_banjo/3.kmeans3.txt', header = FALSE, sep = "")
three.q3 = read.table('wt_consensus_banjo/3.q3.txt', header = FALSE, sep = "")
four.bikmeans3 = read.table('wt_consensus_banjo/4.bikmeans3.txt', header = FALSE, sep = "")
four.i3 = read.table('wt_consensus_banjo/4.i3.txt', header = FALSE, sep = "")
four.kmeans3 = read.table('wt_consensus_banjo/4.kmeans3.txt', header = FALSE, sep = "")
four.q3 = read.table('wt_consensus_banjo/4.q3.txt', header = FALSE, sep = "")
five.bikmeans3 = read.table('wt_consensus_banjo/5.bikmeans3.txt', header = FALSE, sep = "")
five.i3 = read.table('wt_consensus_banjo/5.i3.txt', header = FALSE, sep = "")
five.kmeans3 = read.table('wt_consensus_banjo/5.kmeans3.txt', header = FALSE, sep = "")
five.q3 = read.table('wt_consensus_banjo/5.q3.txt', header = FALSE, sep = "")
six.bikmeans3 = read.table('wt_consensus_banjo/6.bikmeans3.txt', header = FALSE, sep = "")
six.i3 = read.table('wt_consensus_banjo/6.i3.txt', header = FALSE, sep = "")
six.kmeans3 = read.table('wt_consensus_banjo/6.kmeans3.txt', header = FALSE, sep = "")
six.q3 = read.table('wt_consensus_banjo/6.q3.txt', header = FALSE, sep = "")
seven.bikmeans3 = read.table('wt_consensus_banjo/7.bikmeans3.txt', header = FALSE, sep = "")
seven.i3 = read.table('wt_consensus_banjo/7.i3.txt', header = FALSE, sep = "")
seven.kmeans3 = read.table('wt_consensus_banjo/7.kmeans3.txt', header = FALSE, sep = "")
seven.q3 = read.table('wt_consensus_banjo/7.q3.txt', header = FALSE, sep = "")
eight.bikmeans3 = read.table('wt_consensus_banjo/8.bikmeans3.txt', header = FALSE, sep = "")
eight.i3 = read.table('wt_consensus_banjo/8.i3.txt', header = FALSE, sep = "")
eight.kmeans3 = read.table('wt_consensus_banjo/8.kmeans3.txt', header = FALSE, sep = "")
eight.q3 = read.table('wt_consensus_banjo/8.q3.txt', header = FALSE, sep = "")
nine.bikmeans3 = read.table('wt_consensus_banjo/9.bikmeans3.txt', header = FALSE, sep = "")
nine.i3 = read.table('wt_consensus_banjo/9.i3.txt', header = FALSE, sep = "")
nine.kmeans3 = read.table('wt_consensus_banjo/9.kmeans3.txt', header = FALSE, sep = "")
nine.q3 = read.table('wt_consensus_banjo/9.q3.txt', header = FALSE, sep = "")

one.bikmeans4 = read.table('wt_consensus_banjo/1.bikmeans4.txt', header = FALSE, sep = "")
one.i4 = read.table('wt_consensus_banjo/1.i4.txt', header = FALSE, sep = "")
one.kmeans4 = read.table('wt_consensus_banjo/1.kmeans4.txt', header = FALSE, sep = "")
one.q4 = read.table('wt_consensus_banjo/1.q4.txt', header = FALSE, sep = "")
two.bikmeans4 = read.table('wt_consensus_banjo/2.bikmeans4.txt', header = FALSE, sep = "")
two.i4 = read.table('wt_consensus_banjo/2.i4.txt', header = FALSE, sep = "")
two.kmeans4 = read.table('wt_consensus_banjo/2.kmeans4.txt', header = FALSE, sep = "")
two.q4 = read.table('wt_consensus_banjo/2.q4.txt', header = FALSE, sep = "")
three.bikmeans4 = read.table('wt_consensus_banjo/3.bikmeans4.txt', header = FALSE, sep = "")
three.i4 = read.table('wt_consensus_banjo/3.i4.txt', header = FALSE, sep = "")
three.kmeans4 = read.table('wt_consensus_banjo/3.kmeans4.txt', header = FALSE, sep = "")
three.q4 = read.table('wt_consensus_banjo/3.q4.txt', header = FALSE, sep = "")
four.bikmeans4 = read.table('wt_consensus_banjo/4.bikmeans4.txt', header = FALSE, sep = "")
four.i4 = read.table('wt_consensus_banjo/4.i4.txt', header = FALSE, sep = "")
four.kmeans4 = read.table('wt_consensus_banjo/4.kmeans4.txt', header = FALSE, sep = "")
four.q4 = read.table('wt_consensus_banjo/4.q4.txt', header = FALSE, sep = "")
five.bikmeans4 = read.table('wt_consensus_banjo/5.bikmeans4.txt', header = FALSE, sep = "")
five.i4 = read.table('wt_consensus_banjo/5.i4.txt', header = FALSE, sep = "")
five.kmeans4 = read.table('wt_consensus_banjo/5.kmeans4.txt', header = FALSE, sep = "")
five.q4 = read.table('wt_consensus_banjo/5.q4.txt', header = FALSE, sep = "")
six.bikmeans4 = read.table('wt_consensus_banjo/6.bikmeans4.txt', header = FALSE, sep = "")
six.i4 = read.table('wt_consensus_banjo/6.i4.txt', header = FALSE, sep = "")
six.kmeans4 = read.table('wt_consensus_banjo/6.kmeans4.txt', header = FALSE, sep = "")
six.q4 = read.table('wt_consensus_banjo/6.q4.txt', header = FALSE, sep = "")
seven.bikmeans4 = read.table('wt_consensus_banjo/7.bikmeans4.txt', header = FALSE, sep = "")
seven.i4 = read.table('wt_consensus_banjo/7.i4.txt', header = FALSE, sep = "")
seven.kmeans4 = read.table('wt_consensus_banjo/7.kmeans4.txt', header = FALSE, sep = "")
seven.q4 = read.table('wt_consensus_banjo/7.q4.txt', header = FALSE, sep = "")
eight.bikmeans4 = read.table('wt_consensus_banjo/8.bikmeans4.txt', header = FALSE, sep = "")
eight.i4 = read.table('wt_consensus_banjo/8.i4.txt', header = FALSE, sep = "")
eight.kmeans4 = read.table('wt_consensus_banjo/8.kmeans4.txt', header = FALSE, sep = "")
eight.q4 = read.table('wt_consensus_banjo/8.q4.txt', header = FALSE, sep = "")
nine.bikmeans4 = read.table('wt_consensus_banjo/9.bikmeans4.txt', header = FALSE, sep = "")
nine.i4 = read.table('wt_consensus_banjo/9.i4.txt', header = FALSE, sep = "")
nine.kmeans4 = read.table('wt_consensus_banjo/9.kmeans4.txt', header = FALSE, sep = "")
nine.q4 = read.table('wt_consensus_banjo/9.q4.txt', header = FALSE, sep = "")

one.bikmeans5 = read.table('wt_consensus_banjo/1.bikmeans5.txt', header = FALSE, sep = "")
one.i5 = read.table('wt_consensus_banjo/1.i5.txt', header = FALSE, sep = "")
one.kmeans5 = read.table('wt_consensus_banjo/1.kmeans5.txt', header = FALSE, sep = "")
one.q5 = read.table('wt_consensus_banjo/1.q5.txt', header = FALSE, sep = "")
two.bikmeans5 = read.table('wt_consensus_banjo/2.bikmeans5.txt', header = FALSE, sep = "")
two.i5 = read.table('wt_consensus_banjo/2.i5.txt', header = FALSE, sep = "")
two.kmeans5 = read.table('wt_consensus_banjo/2.kmeans5.txt', header = FALSE, sep = "")
two.q5 = read.table('wt_consensus_banjo/2.q5.txt', header = FALSE, sep = "")
three.bikmeans5 = read.table('wt_consensus_banjo/3.bikmeans5.txt', header = FALSE, sep = "")
three.i5 = read.table('wt_consensus_banjo/3.i5.txt', header = FALSE, sep = "")
three.kmeans5 = read.table('wt_consensus_banjo/3.kmeans5.txt', header = FALSE, sep = "")
three.q5 = read.table('wt_consensus_banjo/3.q5.txt', header = FALSE, sep = "")
four.bikmeans5 = read.table('wt_consensus_banjo/4.bikmeans5.txt', header = FALSE, sep = "")
four.i5 = read.table('wt_consensus_banjo/4.i5.txt', header = FALSE, sep = "")
four.kmeans5 = read.table('wt_consensus_banjo/4.kmeans5.txt', header = FALSE, sep = "")
four.q5 = read.table('wt_consensus_banjo/4.q5.txt', header = FALSE, sep = "")
five.bikmeans5 = read.table('wt_consensus_banjo/5.bikmeans5.txt', header = FALSE, sep = "")
five.i5 = read.table('wt_consensus_banjo/5.i5.txt', header = FALSE, sep = "")
five.kmeans5 = read.table('wt_consensus_banjo/5.kmeans5.txt', header = FALSE, sep = "")
five.q5 = read.table('wt_consensus_banjo/5.q5.txt', header = FALSE, sep = "")
six.bikmeans5 = read.table('wt_consensus_banjo/6.bikmeans5.txt', header = FALSE, sep = "")
six.i5 = read.table('wt_consensus_banjo/6.i5.txt', header = FALSE, sep = "")
six.kmeans5 = read.table('wt_consensus_banjo/6.kmeans5.txt', header = FALSE, sep = "")
six.q5 = read.table('wt_consensus_banjo/6.q5.txt', header = FALSE, sep = "")
seven.bikmeans5 = read.table('wt_consensus_banjo/7.bikmeans5.txt', header = FALSE, sep = "")
seven.i5 = read.table('wt_consensus_banjo/7.i5.txt', header = FALSE, sep = "")
seven.kmeans5 = read.table('wt_consensus_banjo/7.kmeans5.txt', header = FALSE, sep = "")
seven.q5 = read.table('wt_consensus_banjo/7.q5.txt', header = FALSE, sep = "")
eight.bikmeans5 = read.table('wt_consensus_banjo/8.bikmeans5.txt', header = FALSE, sep = "")
eight.i5 = read.table('wt_consensus_banjo/8.i5.txt', header = FALSE, sep = "")
eight.kmeans5 = read.table('wt_consensus_banjo/8.kmeans5.txt', header = FALSE, sep = "")
eight.q5 = read.table('wt_consensus_banjo/8.q5.txt', header = FALSE, sep = "")
nine.bikmeans5 = read.table('wt_consensus_banjo/9.bikmeans5.txt', header = FALSE, sep = "")
nine.i5 = read.table('wt_consensus_banjo/9.i5.txt', header = FALSE, sep = "")
nine.kmeans5 = read.table('wt_consensus_banjo/9.kmeans5.txt', header = FALSE, sep = "")
nine.q5 = read.table('wt_consensus_banjo/9.q5.txt', header = FALSE, sep = "")

roc_se = matrix( rep(NA, 9*12), ncol = 9 )
roc_sp = matrix( rep(NA, 9*12), ncol = 9 )

roc_se[1,1] = SeSp(gs, one.bikmeans3)$se
roc_se[1,2] = SeSp(gs, two.bikmeans3)$se
roc_se[1,3] = SeSp(gs, three.bikmeans3)$se
roc_se[1,4] = SeSp(gs, four.bikmeans3)$se
roc_se[1,5] = SeSp(gs, five.bikmeans3)$se
roc_se[1,6] = SeSp(gs, six.bikmeans3)$se
roc_se[1,7] = SeSp(gs, seven.bikmeans3)$se
roc_se[1,8] = SeSp(gs, eight.bikmeans3)$se
roc_se[1,9] = SeSp(gs, nine.bikmeans3)$se
roc_se[2,1] = SeSp(gs, one.bikmeans4)$se
roc_se[2,2] = SeSp(gs, two.bikmeans4)$se
roc_se[2,3] = SeSp(gs, three.bikmeans4)$se
roc_se[2,4] = SeSp(gs, four.bikmeans4)$se
roc_se[2,5] = SeSp(gs, five.bikmeans4)$se
roc_se[2,6] = SeSp(gs, six.bikmeans4)$se
roc_se[2,7] = SeSp(gs, seven.bikmeans4)$se
roc_se[2,8] = SeSp(gs, eight.bikmeans4)$se
roc_se[2,9] = SeSp(gs, nine.bikmeans4)$se
roc_se[3,1] = SeSp(gs, one.bikmeans5)$se
roc_se[3,2] = SeSp(gs, two.bikmeans5)$se
roc_se[3,3] = SeSp(gs, three.bikmeans5)$se
roc_se[3,4] = SeSp(gs, four.bikmeans5)$se
roc_se[3,5] = SeSp(gs, five.bikmeans5)$se
roc_se[3,6] = SeSp(gs, six.bikmeans5)$se
roc_se[3,7] = SeSp(gs, seven.bikmeans5)$se
roc_se[3,8] = SeSp(gs, eight.bikmeans5)$se
roc_se[3,9] = SeSp(gs, nine.bikmeans5)$se

roc_se[4,1] = SeSp(gs, one.i3)$se
roc_se[4,2] = SeSp(gs, two.i3)$se
roc_se[4,3] = SeSp(gs, three.i3)$se
roc_se[4,4] = SeSp(gs, four.i3)$se
roc_se[4,5] = SeSp(gs, five.i3)$se
roc_se[4,6] = SeSp(gs, six.i3)$se
roc_se[4,7] = SeSp(gs, seven.i3)$se
roc_se[4,8] = SeSp(gs, eight.i3)$se
roc_se[4,9] = SeSp(gs, nine.i3)$se
roc_se[5,1] = SeSp(gs, one.i4)$se
roc_se[5,2] = SeSp(gs, two.i4)$se
roc_se[5,3] = SeSp(gs, three.i4)$se
roc_se[5,4] = SeSp(gs, four.i4)$se
roc_se[5,5] = SeSp(gs, five.i4)$se
roc_se[5,6] = SeSp(gs, six.i4)$se
roc_se[5,7] = SeSp(gs, seven.i4)$se
roc_se[5,8] = SeSp(gs, eight.i4)$se
roc_se[5,9] = SeSp(gs, nine.i4)$se
roc_se[6,1] = SeSp(gs, one.i5)$se
roc_se[6,2] = SeSp(gs, two.i5)$se
roc_se[6,3] = SeSp(gs, three.i5)$se
roc_se[6,4] = SeSp(gs, four.i5)$se
roc_se[6,5] = SeSp(gs, five.i5)$se
roc_se[6,6] = SeSp(gs, six.i5)$se
roc_se[6,7] = SeSp(gs, seven.i5)$se
roc_se[6,8] = SeSp(gs, eight.i5)$se
roc_se[6,9] = SeSp(gs, nine.i5)$se

roc_se[7,1] = SeSp(gs, one.kmeans3)$se
roc_se[7,2] = SeSp(gs, two.kmeans3)$se
roc_se[7,3] = SeSp(gs, three.kmeans3)$se
roc_se[7,4] = SeSp(gs, four.kmeans3)$se
roc_se[7,5] = SeSp(gs, five.kmeans3)$se
roc_se[7,6] = SeSp(gs, six.kmeans3)$se
roc_se[7,7] = SeSp(gs, seven.kmeans3)$se
roc_se[7,8] = SeSp(gs, eight.kmeans3)$se
roc_se[7,9] = SeSp(gs, nine.kmeans3)$se
roc_se[8,1] = SeSp(gs, one.kmeans4)$se
roc_se[8,2] = SeSp(gs, two.kmeans4)$se
roc_se[8,3] = SeSp(gs, three.kmeans4)$se
roc_se[8,4] = SeSp(gs, four.kmeans4)$se
roc_se[8,5] = SeSp(gs, five.kmeans4)$se
roc_se[8,6] = SeSp(gs, six.kmeans4)$se
roc_se[8,7] = SeSp(gs, seven.kmeans4)$se
roc_se[8,8] = SeSp(gs, eight.kmeans4)$se
roc_se[8,9] = SeSp(gs, nine.kmeans4)$se
roc_se[9,1] = SeSp(gs, one.kmeans5)$se
roc_se[9,2] = SeSp(gs, two.kmeans5)$se
roc_se[9,3] = SeSp(gs, three.kmeans5)$se
roc_se[9,4] = SeSp(gs, four.kmeans5)$se
roc_se[9,5] = SeSp(gs, five.kmeans5)$se
roc_se[9,6] = SeSp(gs, six.kmeans5)$se
roc_se[9,7] = SeSp(gs, seven.kmeans5)$se
roc_se[9,8] = SeSp(gs, eight.kmeans5)$se
roc_se[9,9] = SeSp(gs, nine.kmeans5)$se

roc_se[10,1] = SeSp(gs, one.q3)$se
roc_se[10,2] = SeSp(gs, two.q3)$se
roc_se[10,3] = SeSp(gs, three.q3)$se
roc_se[10,4] = SeSp(gs, four.q3)$se
roc_se[10,5] = SeSp(gs, five.q3)$se
roc_se[10,6] = SeSp(gs, six.q3)$se
roc_se[10,7] = SeSp(gs, seven.q3)$se
roc_se[10,8] = SeSp(gs, eight.q3)$se
roc_se[10,9] = SeSp(gs, nine.q3)$se
roc_se[11,1] = SeSp(gs, one.q4)$se
roc_se[11,2] = SeSp(gs, two.q4)$se
roc_se[11,3] = SeSp(gs, three.q4)$se
roc_se[11,4] = SeSp(gs, four.q4)$se
roc_se[11,5] = SeSp(gs, five.q4)$se
roc_se[11,6] = SeSp(gs, six.q4)$se
roc_se[11,7] = SeSp(gs, seven.q4)$se
roc_se[11,8] = SeSp(gs, eight.q4)$se
roc_se[11,9] = SeSp(gs, nine.q4)$se
roc_se[12,1] = SeSp(gs, one.q5)$se
roc_se[12,2] = SeSp(gs, two.q5)$se
roc_se[12,3] = SeSp(gs, three.q5)$se
roc_se[12,4] = SeSp(gs, four.q5)$se
roc_se[12,5] = SeSp(gs, five.q5)$se
roc_se[12,6] = SeSp(gs, six.q5)$se
roc_se[12,7] = SeSp(gs, seven.q5)$se
roc_se[12,8] = SeSp(gs, eight.q5)$se
roc_se[12,9] = SeSp(gs, nine.q5)$se

roc_sp[1,1] = SeSp(gs, one.bikmeans3)$sp
roc_sp[1,2] = SeSp(gs, two.bikmeans3)$sp
roc_sp[1,3] = SeSp(gs, three.bikmeans3)$sp
roc_sp[1,4] = SeSp(gs, four.bikmeans3)$sp
roc_sp[1,5] = SeSp(gs, five.bikmeans3)$sp
roc_sp[1,6] = SeSp(gs, six.bikmeans3)$sp
roc_sp[1,7] = SeSp(gs, seven.bikmeans3)$sp
roc_sp[1,8] = SeSp(gs, eight.bikmeans3)$sp
roc_sp[1,9] = SeSp(gs, nine.bikmeans3)$sp
roc_sp[2,1] = SeSp(gs, one.bikmeans4)$sp
roc_sp[2,2] = SeSp(gs, two.bikmeans4)$sp
roc_sp[2,3] = SeSp(gs, three.bikmeans4)$sp
roc_sp[2,4] = SeSp(gs, four.bikmeans4)$sp
roc_sp[2,5] = SeSp(gs, five.bikmeans4)$sp
roc_sp[2,6] = SeSp(gs, six.bikmeans4)$sp
roc_sp[2,7] = SeSp(gs, seven.bikmeans4)$sp
roc_sp[2,8] = SeSp(gs, eight.bikmeans4)$sp
roc_sp[2,9] = SeSp(gs, nine.bikmeans4)$sp
roc_sp[3,1] = SeSp(gs, one.bikmeans5)$sp
roc_sp[3,2] = SeSp(gs, two.bikmeans5)$sp
roc_sp[3,3] = SeSp(gs, three.bikmeans5)$sp
roc_sp[3,4] = SeSp(gs, four.bikmeans5)$sp
roc_sp[3,5] = SeSp(gs, five.bikmeans5)$sp
roc_sp[3,6] = SeSp(gs, six.bikmeans5)$sp
roc_sp[3,7] = SeSp(gs, seven.bikmeans5)$sp
roc_sp[3,8] = SeSp(gs, eight.bikmeans5)$sp
roc_sp[3,9] = SeSp(gs, nine.bikmeans5)$sp

roc_sp[4,1] = SeSp(gs, one.i3)$sp
roc_sp[4,2] = SeSp(gs, two.i3)$sp
roc_sp[4,3] = SeSp(gs, three.i3)$sp
roc_sp[4,4] = SeSp(gs, four.i3)$sp
roc_sp[4,5] = SeSp(gs, five.i3)$sp
roc_sp[4,6] = SeSp(gs, six.i3)$sp
roc_sp[4,7] = SeSp(gs, seven.i3)$sp
roc_sp[4,8] = SeSp(gs, eight.i3)$sp
roc_sp[4,9] = SeSp(gs, nine.i3)$sp
roc_sp[5,1] = SeSp(gs, one.i4)$sp
roc_sp[5,2] = SeSp(gs, two.i4)$sp
roc_sp[5,3] = SeSp(gs, three.i4)$sp
roc_sp[5,4] = SeSp(gs, four.i4)$sp
roc_sp[5,5] = SeSp(gs, five.i4)$sp
roc_sp[5,6] = SeSp(gs, six.i4)$sp
roc_sp[5,7] = SeSp(gs, seven.i4)$sp
roc_sp[5,8] = SeSp(gs, eight.i4)$sp
roc_sp[5,9] = SeSp(gs, nine.i4)$sp
roc_sp[6,1] = SeSp(gs, one.i5)$sp
roc_sp[6,2] = SeSp(gs, two.i5)$sp
roc_sp[6,3] = SeSp(gs, three.i5)$sp
roc_sp[6,4] = SeSp(gs, four.i5)$sp
roc_sp[6,5] = SeSp(gs, five.i5)$sp
roc_sp[6,6] = SeSp(gs, six.i5)$sp
roc_sp[6,7] = SeSp(gs, seven.i5)$sp
roc_sp[6,8] = SeSp(gs, eight.i5)$sp
roc_sp[6,9] = SeSp(gs, nine.i5)$sp

roc_sp[7,1] = SeSp(gs, one.kmeans3)$sp
roc_sp[7,2] = SeSp(gs, two.kmeans3)$sp
roc_sp[7,3] = SeSp(gs, three.kmeans3)$sp
roc_sp[7,4] = SeSp(gs, four.kmeans3)$sp
roc_sp[7,5] = SeSp(gs, five.kmeans3)$sp
roc_sp[7,6] = SeSp(gs, six.kmeans3)$sp
roc_sp[7,7] = SeSp(gs, seven.kmeans3)$sp
roc_sp[7,8] = SeSp(gs, eight.kmeans3)$sp
roc_sp[7,9] = SeSp(gs, nine.kmeans3)$sp
roc_sp[8,1] = SeSp(gs, one.kmeans4)$sp
roc_sp[8,2] = SeSp(gs, two.kmeans4)$sp
roc_sp[8,3] = SeSp(gs, three.kmeans4)$sp
roc_sp[8,4] = SeSp(gs, four.kmeans4)$sp
roc_sp[8,5] = SeSp(gs, five.kmeans4)$sp
roc_sp[8,6] = SeSp(gs, six.kmeans4)$sp
roc_sp[8,7] = SeSp(gs, seven.kmeans4)$sp
roc_sp[8,8] = SeSp(gs, eight.kmeans4)$sp
roc_sp[8,9] = SeSp(gs, nine.kmeans4)$sp
roc_sp[9,1] = SeSp(gs, one.kmeans5)$sp
roc_sp[9,2] = SeSp(gs, two.kmeans5)$sp
roc_sp[9,3] = SeSp(gs, three.kmeans5)$sp
roc_sp[9,4] = SeSp(gs, four.kmeans5)$sp
roc_sp[9,5] = SeSp(gs, five.kmeans5)$sp
roc_sp[9,6] = SeSp(gs, six.kmeans5)$sp
roc_sp[9,7] = SeSp(gs, seven.kmeans5)$sp
roc_sp[9,8] = SeSp(gs, eight.kmeans5)$sp
roc_sp[9,9] = SeSp(gs, nine.kmeans5)$sp

roc_sp[10,1] = SeSp(gs, one.q3)$sp
roc_sp[10,2] = SeSp(gs, two.q3)$sp
roc_sp[10,3] = SeSp(gs, three.q3)$sp
roc_sp[10,4] = SeSp(gs, four.q3)$sp
roc_sp[10,5] = SeSp(gs, five.q3)$sp
roc_sp[10,6] = SeSp(gs, six.q3)$sp
roc_sp[10,7] = SeSp(gs, seven.q3)$sp
roc_sp[10,8] = SeSp(gs, eight.q3)$sp
roc_sp[10,9] = SeSp(gs, nine.q3)$sp
roc_sp[11,1] = SeSp(gs, one.q4)$sp
roc_sp[11,2] = SeSp(gs, two.q4)$sp
roc_sp[11,3] = SeSp(gs, three.q4)$sp
roc_sp[11,4] = SeSp(gs, four.q4)$sp
roc_sp[11,5] = SeSp(gs, five.q4)$sp
roc_sp[11,6] = SeSp(gs, six.q4)$sp
roc_sp[11,7] = SeSp(gs, seven.q4)$sp
roc_sp[11,8] = SeSp(gs, eight.q4)$sp
roc_sp[11,9] = SeSp(gs, nine.q4)$sp
roc_sp[12,1] = SeSp(gs, one.q5)$sp
roc_sp[12,2] = SeSp(gs, two.q5)$sp
roc_sp[12,3] = SeSp(gs, three.q5)$sp
roc_sp[12,4] = SeSp(gs, four.q5)$sp
roc_sp[12,5] = SeSp(gs, five.q5)$sp
roc_sp[12,6] = SeSp(gs, six.q5)$sp
roc_sp[12,7] = SeSp(gs, seven.q5)$sp
roc_sp[12,8] = SeSp(gs, eight.q5)$sp
roc_sp[12,9] = SeSp(gs, nine.q5)$sp

# write.table(roc_se, file = '~/Desktop/se.csv', sep = ',', col.names = FALSE, row.names = FALSE)
# write.table(roc_sp, file = '~/Desktop/sp.csv', sep = ',', col.names = FALSE, row.names = FALSE)
