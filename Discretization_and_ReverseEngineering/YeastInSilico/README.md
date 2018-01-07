This README.md is created by Yuezhe Li on Dec. 4, 2016

more information about DREAM 3 IN SILICO NETWORK CHALLENGE, CHECK:
https://www.synapse.org/#!Synapse:syn2853594/wiki/71567
all the data and gold standard are from DREAM 3 IN SILICO NETWORK CHALLENGE
here data are from InSilicoSize100-Yeast1-trajectories.txt and DREAM3GoldStandard_InSilicoSize100_Yeast1.txt

AUROC_AUPR.R: 
calculate area under the ROC curve/ precision-recall curve;
this function depends on processed results from TDBN (see folder 'Delay=4' or 'Delay=10') and commend line input. See more on ExampleTop75.sh

Delay=4: 
folder contains processed results (processed by RawResultProcess.py) from original output file (output.txt) with maximum delay = 4. See more on ExampleTop75.sh

Delay=10: 
folder contains processed results (processed by RawResultProcess.py) from original output file (output.txt) with maximum delay = 10. See more on ExampleTop75.sh.

DifferenceINlinks.r:
compare edge difference between two networks;
default compare the network with mean discretization network

DiscData:
folder of discretized data

DREAM3GoldStandard_InSilicoSize100_Yeast1.txt:
source file of gold standard that is downloaded from DREAM 3 challenge website

ExampleTop75.sh:
An example of how to run everything in this bash script
TDBN is time consuming. Single thread running could take more than 24 hours. 

goldstandardprocessing.py:
process the gold standard downloaded from website (DREAM3GoldStandard_InSilicoSize100_Yeast1.txt) to a connection matrix (gsyeast1.txt). See more on ExampleTop75.sh.

gsyeast1.txt:
gold standard in a connection matrix form. See more on ExampleTop75.sh.

RawResultProcess.py:
process raw results (output.txt) by TDBN algorithm. See more on ExampleTop75.sh.

ROCs_Nov12.m:
plot roc curves for TDBN results; 
depend on SESP_DREAM3.mat

SESP_DREAM3.mat:
saved sensitivity and specificity values for TDBN results;
required for ROCs_Nov12.m to run; 

TDBN.py:
time-delatey dynamic Bayesian network as the reverse engineering machine here. 
More details about the algorithm and its application in Zou, Min, and Suzanne D. Conzen. "A new dynamic Bayesian network (DBN) approach for identifying gene regulatory networks from time course microarray data." Bioinformatics 21.1 (2005): 71-79. && Li, Peng, et al. "Gene regulatory network inference and validation using relative change ratio analysis and time-delayed dynamic Bayesian network." EURASIP Journal on Bioinformatics and Systems Biology 2014.1 (2014): 1.
See more details about how to run it in ExampleTop75.sh.

writefile.r:
format discretized data into the form that TDBN can use. 
See more details about how to run it in ExampleTop75.sh.

Noisy01ByVariable
adding 1% noise to 30% of the variable

Noisy05ByVariable
adding 5% noise to 30% of the variable

