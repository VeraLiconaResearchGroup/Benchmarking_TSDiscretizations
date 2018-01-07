other_banjo folder:
BANJO 2.2.0 with changed the cut off threshold, for example, banjo4.jar means this version of BANJO software has cut off threshold = 0.4

Point5:
an example of how to run it as all; 
|--banjo5.jar: original BANJO 2.2.0 jar file; 
|
|--MYDATA: data and setting files for BANJO to run; 
|    |
|    |--steady-off: IRMA network with glucose as carbon source; 
|    |              discretized data and setting files; 
|    |              (names of discretization).txt: discretized data of steady state; 
|    |              Setting*.txt: BANJO setting files; see more at steady-on-off.sh; 
|    |              report*.txt: BANJO results; 
|    |--steady-on:  IRMA network with galactose as carbon source; 
|                   discretized data and setting files; 
|                   (names of discretization).txt: discretized data of steady state; 
|                   Setting*.txt: BANJO setting files; see more at steady-on-off.sh; 
|                   report*.txt: BANJO results; 
|    (note that gallo also has the name of TDT, median the same as i2)
|
|--steady-on-off.sh: bash script to run for all the different discretzations; 

