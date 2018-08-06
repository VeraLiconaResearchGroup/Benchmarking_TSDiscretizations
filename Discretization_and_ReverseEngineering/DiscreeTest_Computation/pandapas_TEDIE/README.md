This is the two-step discretization evaluation (DiscreeTest) procedure. This procedure is proposed by T. Jann, Y. Li, and Dr. P. Vera-Licona. 

DiscreeTest procedure contains two steps: 
1. Qualification: run Wilcoxon sign rank test; 
2. Evaluaton: calculate mean area between the curves as a criteria; 

##------ functions ------##

benchmark.m: 
For evaluation step; 
Depend on prebenchmark.m;
!! Each time series should come in as a n*1 vertical vector; 
This function is able to calculate a matrix with multiple times series when each are coming in a column; 


prebenchmark.m: 
calculate difference of area between lines formed by 4 points: 
                line 1: (x1, y1) -- (x2, y2)
				line 2: (x3, y3) -- (x4, y4)
				A sub-funciton for benchmark.m; 
Notice that this is NOT mean area between the curves; 

##------ Examples ------##

*.mat: 
data file for example use; 

main_*.m: example files for DiscreeTest procedure that uses benchmark.m;
main_main_pandapas.m is the network that the data has already been converted into .mat file (same folder); the first section includes preparing data file for BANJO/ TDBN reverse engineering machines, it could be ignored, or convert for other use; other see inside the script comments; finally all the results for qualification & evaluation would be printed on the screen. This script requires pandapas_wt.mat to run properly. 
main_IRMA.m: two-step discretization evaluation (DiscreeTest) procedure on IRMA network; this depends on external data file; see code for detail; 
main_YeastInSilico.m: two-step discretization evaluation (DiscreeTest) procedure on YeastInSilico network; this depends on external data file; see code for detail; 

/* A complete example should be run through main_main_pandapas.m with pandapas_wt.mat */
