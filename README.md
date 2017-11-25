This is the two-step discretization evaluation (TEDIE) procedure. This procedure is proposed by T. Jann, Y. Li, and Dr. P. Vera-Licona. 

TEDIE procedure contains two steps: 
1. Qualification: run sign test; 
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

choosedialog.m:
the GUI for choosing the input variable from variable space in MATLAB;

GetDiscretizaionethods.m: 
to get variables in the MATLAB variable space; 
it serves as a part in choosedialog GUI; 

##------ Examples ------##

*.mat: 
data file for example use; 

main_*.m: example files for TEDIE procedure that uses benchmark.m;


##------- GITHUB ---------##

https://github.com/VeraLiconaResearchGroup/DiscretizationAlgorithms
