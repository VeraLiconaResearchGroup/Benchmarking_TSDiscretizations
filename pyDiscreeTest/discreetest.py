# Script to rank each discretization by their DiscreeTest values

import argparse
import numpy as np
import glob
import time
import logging

from sklearn.preprocessing import MinMaxScaler
from statsmodels.stats.descriptivestats import sign_test

starttime = time.time()
logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s  [ %(levelname)-4s ] %(name)-6s  %(message)s')
def calculateMABC(data1, data2):
    data1 = np.atleast_2d(data1)
    data2 = np.atleast_2d(data2)
    if data1.shape != data2.shape:
        raise AssertionError('data1 and data2 dimensions do not match')
    area = 0
    for field in range(data1.shape[1]):
        for datum in range(data1.shape[0]-1):
            x1 = datum
            x2 = datum+1
            y1 = data1[datum, field]
            y2 = data1[datum+1, field]
            u1 = x1
            u2 = x2
            v1 = data2[datum, field]
            v2 = data2[datum+1, field]
            area += trapezoid(x1,y1,x2,y2,u1,v1,u2,v2)
    return (area/data1.shape[0])

def trapezoid(x1,y1,x2,y2,u1,v1,u2,v2):
    """
    calculate area between two lines.
    line1 = (x1, y1) -- (x2,y2)
    line2 = (u1, v1) -- (u2, v2)
    """
    diff1 = v1 - y1
    diff2 = v2 - y2
    dif = diff1*diff2
    if dif < 0: # then we know the lines intersect
        m1 = (y2-y1)/(x2-x1)
        b1 = y1 - m1*x1
        m2 = (v2-v1)/(u2-u1)
        b2 = v1 - m2*u1
        xint = (-1)*(b2 - b1)/(m2-m1)
        area1 = abs(v1-y1)*abs(xint-x1)/2
        area2 = abs(v2-y2)*abs(xint-x2)/2
        area = area1 + area2
    elif dif > 0:
        area = ( abs(diff1) + abs(diff2) ) * abs(x2-x1)/2
    else:
        ydif = max( abs(v2-y2), abs(v1-y1) )
        xdif = abs(x2 - x1)
        area = xdif*ydif/2
    return area

if __name__ == '__main__':
    ## USAGE:

    # python discreetest.py -r example_data/original_data.csv -d example_data/discretized_data/ -w example_results/ -a 0.01 -n false
    # python discreetest.py -r example_data/original_data.npy -d example_data/discretized_data/ -w example__results/ -a 0.01 -n true

    parser = argparse.ArgumentParser()
    parser.add_argument("-r", "--rawfile", help="load file with original time series data", required=True)
    parser.add_argument("-d", "--discretizeddirectory", help="directory with all the discretized time series data", required=True)
    parser.add_argument("-w", "--writedirectory", help="directory to write results to (default pwd)", required=False)
    parser.add_argument("-p", "--prefix", help="prefix of discretized data files (default none)", required=False)
    parser.add_argument("-a", "--alpha", help="alpha for sign test (default 0.01)", required=False)
    parser.add_argument("-n", "--numpy", help="use numpy pickles for data arrays instead of csv (default False)", required=False)

    args = parser.parse_args()

    rawfile = args.rawfile
    discretizeddirectory = args.discretizeddirectory
    if not discretizeddirectory.endswith('/'):
        discretizeddirectory = discretizeddirectory + '/'
    if args.writedirectory:
        writedir = args.writedirectory
    else:
        writedir = ''
    if args.prefix:
        prefix = args.prefix
    else:
        prefix = ""
    if args.alpha:
        alpha = float(args.alpha)
    else:
        alpha = 0.01
    if args.numpy and (args.numpy.lower() == 'true'):
        usenp = True
    else:
        usenp = False
    if usenp:
        data_original = np.load(rawfile)
    else:
        data_original = np.loadtxt(rawfile, delimiter=',')
    dict_data_discretized = {}
    if usenp:
        for f in glob.glob(discretizeddirectory + prefix + '*.npy'):
            logger.info('loading data from %s', f)
            dict_data_discretized[f] = np.load(f)
    else:
        for f in glob.glob(discretizeddirectory + prefix + '*.csv'):
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
            logger.info('%s failed the sign test, assigning inf mabc', discretization)
            mabc_values[discretization] = float("inf")
        else:
            mabc_values[discretization] = calculateMABC(data_d_s, data_original)

    logger.info('mabc values: %s', mabc_values)
    np.save(writedir + 'mabc_values_trial_' + str(int(starttime)) + '.npy', mabc_values)
    best = min(mabc_values, key=mabc_values.get)
    logger.info('best discretization: %s with mabc = %s', best, mabc_values[best])

endtime = time.time()
logger.info('total script duration: %s seconds', endtime - starttime)
