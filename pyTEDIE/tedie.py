# Script to rank each discretization by their TEDIE values

import argparse
import numpy as np
import glob
from sklearn.preprocessing import MinMaxScaler
from statsmodels.stats.descriptivestats import sign_test
from mabc import MABC

import logging
logger = logging.getLogger(__name__)

if __name__ == '__main__':
    ## USAGE:

    # python tedie.py -r example_original_data.tsv -d example_discretized_data/ -w example_results/ -a 0.01 -n false 
    # python tedie.py -r example_original_data.npy -d example_discretized_data/ -w example_results/ -a 0.01 -n true 

    parser = argparse.ArgumentParser()
    parser.add_argument("-r", "--rawfile", help="load file with original time series data", required=True)
    parser.add_argument("-d", "--discretizeddirectory", help="directory with all the discretized time series data", required=True)
    parser.add_argument("-w", "--writedirectory", help="directory to write results to (default pwd)", required=False)
    parser.add_argument("-p", "--prefix", help="prefix of discretized data files (optional, default none)", required=False)
    parser.add_argument("-a", "--alpha", help="alpha for sign test (default 0.01)", required=False)
    parser.add_argument("-n", "--numpy", help="use numpy pickles for data arrays (default True, otherwise expects tsv)", required=False)

    args = parser.parse_args()

    rawfile = args.rawfile
    discretizeddirectory = args.discretizeddirectory
    if not discretizeddirectory.endswith('/'):
        discretizeddirectory = discretizeddirectory + '/'
    writedir = args.writedirectory
    if args.prefix:
        prefix = args.prefix
    else:
        prefix = ""
    if args.alpha:
        alpha = float(args.alpha)
    else:
        alpha = 0.01
    if args.numpy and (args.numpy.lower() == 'false'):
        usenp = False
    else:
        usenp = True 
    if usenp:
        data_original = np.load(rawfile)
    else:
        data_original = np.loadtxt(rawfile, delimiter=',')
    dict_data_discretized = {}
    if usenp:
        for f in glob.glob(discretizeddirectory + prefix + '*.npy'):
            print('loading data from ' + f)
            logger.info('loading data from %s', f)
            dict_data_discretized[f] = np.load(f)
    else:
        for f in glob.glob(discretizeddirectory + prefix + '*.csv'):
            print('loading data from ' + f)
            logger.info('loading data from %s', f)
            dict_data_discretized[f] = np.loadtxt(f, delimiter=',')
    
    mabc_values = {}
    for discretization, data_d in dict_data_discretized.items():
        scaler = MinMaxScaler()
        data_d_s = scaler.fit_transform(data_d.astype(float))
        if data_original.shape != data_d_s.shape:
            raise AssertionError('data dimensions do not match')
        if np.isnan(data_original).any() or np.isnan(data_d_s).any():
            raise AssertionError('please make sure your data does not have nan values')
        statistic, pvalue = sign_test(data_original.flatten(), data_d_s.flatten()) # this is different than the original code. flatten() turns the T x D matrix into one vector
        if pvalue < alpha:
            print(discretization + ' failed the sign test, assigning inf mabc')
            logger.info('%s failed the sign test, assigning inf mabc', discretization)
            mabc_values[discretization] = float("inf")
        else:
            mabc = MABC()
            mabc_values[discretization] = mabc.calculate(data_d_s, data_original)

    print(mabc_values)
    best = min(mabc_values, key=mabc_values.get)
    print('best discretization:', best, mabc_values[best])
    logger.info('best discretization: %s with mabc = %s', best, mabc_values[best])


