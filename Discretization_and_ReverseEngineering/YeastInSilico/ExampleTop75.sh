#/bin/bash

# this is an example how to run everything to get the desired result
# using top75 discretization
# change 'top75' on the lines for the desired discretization

# generate the proper form of gold standard to the following calculation
# if gsyeast1.txt had existed in the current folder, then there is no need to run the following line
python goldstandardprocessing.py 

# !! change the discretization name for Rscript, or you will have the wrong answer !!

Rscript --verbose writefile.r top75

# using previous generated file for reverse engineering using time-delayed dynamic bayesian network
# for the current setting, the following line is not required as results have been saved in folder "Delay=4"
# use control + c to break it
python TDBN.py > output.txt
# save things on the screen from line starts with "file 1" before "Cong!"
# save as txt file and move to folder "Delay=4", or change path in the following R scripts
rm y*.txt

# process raw results
python RawResultProcess.py > top75.txt
rm output.txt
# !! run the following line if there has no results that are already generated!!!
# mv top75.txt /Delay=4/top75.txt
rm top75.txt

# AUROC calculation 

Rscript AUROC_AUPR.R top75

# see this network different from the network from mean discretization

Rscript DifferenceINlinks.r top75

# see whether this discretization could pass our benckmark step 1 (qualification)

Rscript Qualification_Residual.r top75

