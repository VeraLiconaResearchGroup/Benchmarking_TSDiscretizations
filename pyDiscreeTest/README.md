# DiscreeTest
This is the Python script for the two-step discretization evaluation (DiscreeTest) procedure proposed by T. Jann, Y. Li, and Dr. P. Vera-Licona.

The procedure ranks discretizations by their DiscreeTest metric values, and outputs the best discretization. The DiscreeTest metric contains two steps:
1. Qualification: run sign test
2. Evaluaton: calculate mean area between the curves (MABC) metric

This script takes an original time series and any number of candidate discretized time series. It calculates and saves a dictionary of each discretization's MABC in a numpy file, and prints the best discretization to console.

Note: Discretized time series that fail qualification have MABCs of infinity (and thus will never be the best, unless no other discretizations qualify).

## Prereqs and Dependencies
All open source:
- Python (https://www.python.org/getit/)
- Numpy (https://www.scipy.org/scipylib/download.html)
- Scikit-learn (http://scikit-learn.org/stable/install.html)
- StatsModels: (http://www.statsmodels.org/dev/install.html)

## Synopsis
```
python discreetest.py [options]
```

## Options
```
-r rawfile
-d discretizeddirectory
```
Where `rawfile` is the file with original time series data, and `discretizeddirectory` is the directory where all the files with discretized time series data are located.

## Optional options
```
-w writedirectory
-p prefix
-a alpha
-n numpy
```
Where `writedirectory` is the directory to write results to (default current directory), `prefix` is the prefix of discretized data files (default none), `alpha` is the minimum p-value for the sign test during qualification (default 0.01), and `numpy` is the flag to use `np.load` for .npy files instead of `np.loadtxt` for .csv files (default False).

## Quick help
```
python discreetest.py -h
```

## Example
With the included `rawfile` and `discretizeddirectory` in the `example_data` directory,

using CSV format:
```
python discreetest.py -r example_data/original_data.csv -d example_data/discretized_data/ -w example_results/ -a 0.01 -n false
```

using numpy format:
```
python discreetest.py -r example_data/original_data.npy -d example_data/discretized_data/ -w example_results/ -a 0.01 -n true
```

## GitHub
https://github.com/VeraLiconaResearchGroup/DiscretizationAlgorithms
