data analyzed here is from Pandapas network; 
noiseless data are generated ....
then noise (1% or 5%) is added to the original noiseless data
how the noise is added can be found in Discretization_and_ReverseEngineering/Pandapas/noise_pandapas.m

computation can be devided into 3 parts: 

Part 1: directly look at confusion matrix on trend; this is achieved by comparing changes in the original data and discretized data step by step on the temporal domain; This part is consist of scripts ConfusionMTrend.m, wt_pandapas.m; noise_pandapas.m; 
A variation is to "weight" the direction comparison with how much the original data changes; this consists script of WeightedConfusionMTrend.m; 

Part 2: indirectly look at the trend of the data by looking at the number of local maximum and local minimum; either local maximum or local minimum signals the change of the moving direction in the time series, thus serves an indicator for the trend; this part of the code consists of DerivativeTrend.m, 


Part 3: visualization; this is to use examples to illustrates ideas behind our analysis; this part consists of code DisPlot.m, Normalization.m (to normalize all the time series between 0 and 1 using its maximum and minimum values)