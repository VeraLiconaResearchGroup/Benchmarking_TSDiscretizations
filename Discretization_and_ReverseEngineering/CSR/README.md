Discretization:
discretized data using 11 different discretization methods (bikmeans2, TDT, i2, kmeans2, max25, max50, max75, mean, q2, top25, top75)

forRembedding:
prior knowledge network (PKN-ExtLiverBMC2012.sif) and data file (PKN-ExtLiverBMC2012.csv)

NetworkComparisonAnalysis: 
to analyze different optimezed network, not only their errors, but also their intrinsic differences
|
|---err_max50.RData: errors and optimized networks using max50 
|   discretization under different parameter pairs. (upper and 
|   lower bound of size penalty)
|
|---errorNov3.RData: errors and optimized networks using mean, bikmeans2, TDT, i2, 
|   kmeans2, max25, max75, q2, top75, and top25 under different parameter 
|   pairs. (upper and lower bound of size penalty)
|   upper and lower bound of size penalty: 
|       err_0: (0.1, 10) (default parameters)
|       err1: (0.1, 1)
|       err2: (0.01, 0.1)
|       err3: (0.001, 0.01)
|       err4: (1, 100.1)
|       err5: (0.001, 0.1)
|       err6: (0.01, 10)
|
|---NetworkComparison.r: compare added/ missed edges from mean discretzation optimized result


