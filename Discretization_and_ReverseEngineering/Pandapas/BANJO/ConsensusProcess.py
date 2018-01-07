import os
import sys
import numpy as np

def ReleaseMyself(file_path_1, percentage):
    gal_q2 = open(file_path_1, 'r')
    readin = gal_q2.readlines()
    
    cons_matrix = np.zeros((13,13))
    # here we reference our golden stanrdard in dream 3 data
    # all the upstream are saved as column, downstream as row coordinates

    for wordline in readin:
        words = wordline.split('->')
        try: 
            upstream = int( float(words[0]) )
            intre = words[1]
            inter = intre.split(';')
            downsteam = int( float(inter[0]) )
            intre = None
            inter = None
            # convert to the array type 
            upstream = upstream - 1
            downsteam = downsteam -1
            cons_matrix[upstream, downsteam] += 1
        except:
            pass
        words = None
    
    # each one contains 3 different banjo versions with 8 run each
    # thus consensus should be more than 24 times.
    # we set threshold as percentage of the time
    thres = 24*percentage
    print thres, cons_matrix
    for i in range(0,13):
        for j in range(0,13):
            if cons_matrix[i,j] > thres:
                cons_matrix[i,j] = 1
            else:
                cons_matrix[i,j] = 0
#    print cons_matrix
#    np.savetxt('i5_consensus.txt',links, fmt = '%i')        
    return cons_matrix

my_current_dir = os.getcwd()

prob = 0.2

links = ReleaseMyself('banjo_pandapas/9_bikmeans3_consensus.txt', prob)
np.savetxt('9.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_bikmeans3_consensus.txt', prob)
np.savetxt('8.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_bikmeans3_consensus.txt', prob)
np.savetxt('7.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_bikmeans3_consensus.txt', prob)
np.savetxt('6.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_bikmeans3_consensus.txt', prob)
np.savetxt('5.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_bikmeans3_consensus.txt', prob)
np.savetxt('4.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_bikmeans3_consensus.txt', prob)
np.savetxt('3.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_bikmeans3_consensus.txt', prob)
np.savetxt('2.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_bikmeans3_consensus.txt', prob)
np.savetxt('1.bikmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/9_bikmeans4_consensus.txt', prob)
np.savetxt('9.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_bikmeans4_consensus.txt', prob)
np.savetxt('8.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_bikmeans4_consensus.txt', prob)
np.savetxt('7.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_bikmeans4_consensus.txt', prob)
np.savetxt('6.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_bikmeans4_consensus.txt', prob)
np.savetxt('5.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_bikmeans4_consensus.txt', prob)
np.savetxt('4.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_bikmeans4_consensus.txt', prob)
np.savetxt('3.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_bikmeans4_consensus.txt', prob)
np.savetxt('2.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_bikmeans4_consensus.txt', prob)
np.savetxt('1.bikmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/9_bikmeans5_consensus.txt', prob)
np.savetxt('9.bikmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_bikmeans5_consensus.txt', prob)
np.savetxt('8.bikmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_bikmeans5_consensus.txt', prob)
np.savetxt('7.bikmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_bikmeans5_consensus.txt', prob)
np.savetxt('6.bikmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_bikmeans5_consensus.txt', prob)
np.savetxt('5.bikmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_bikmeans5_consensus.txt', prob)
np.savetxt('4.bikmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_bikmeans5_consensus.txt', prob)
np.savetxt('3.bikmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_bikmeans5_consensus.txt', prob)
np.savetxt('2.bikmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_bikmeans5_consensus.txt', prob)
np.savetxt('1.bikmeans5.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_i3_consensus.txt', prob)
np.savetxt('9.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_i3_consensus.txt', prob)
np.savetxt('8.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_i3_consensus.txt', prob)
np.savetxt('7.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_i3_consensus.txt', prob)
np.savetxt('6.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_i3_consensus.txt', prob)
np.savetxt('5.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_i3_consensus.txt', prob)
np.savetxt('4.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_i3_consensus.txt', prob)
np.savetxt('3.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_i3_consensus.txt', prob)
np.savetxt('2.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_i3_consensus.txt', prob)
np.savetxt('1.i3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/9_i4_consensus.txt', prob)
np.savetxt('9.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_i4_consensus.txt', prob)
np.savetxt('8.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_i4_consensus.txt', prob)
np.savetxt('7.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_i4_consensus.txt', prob)
np.savetxt('6.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_i4_consensus.txt', prob)
np.savetxt('5.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_i4_consensus.txt', prob)
np.savetxt('4.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_i4_consensus.txt', prob)
np.savetxt('3.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_i4_consensus.txt', prob)
np.savetxt('2.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_i4_consensus.txt', prob)
np.savetxt('1.i4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/9_i5_consensus.txt', prob)
np.savetxt('9.i5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_i5_consensus.txt', prob)
np.savetxt('8.i5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_i5_consensus.txt', prob)
np.savetxt('7.i5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_i5_consensus.txt', prob)
np.savetxt('6.i5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_i5_consensus.txt', prob)
np.savetxt('5.i5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_i5_consensus.txt', prob)
np.savetxt('4.i5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_i5_consensus.txt', prob)
np.savetxt('3.i5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_i5_consensus.txt', prob)
np.savetxt('2.i5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_i5_consensus.txt', prob)
np.savetxt('1.i5.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_kmeans3_consensus.txt', prob)
np.savetxt('9.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_kmeans3_consensus.txt', prob)
np.savetxt('8.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_kmeans3_consensus.txt', prob)
np.savetxt('7.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_kmeans3_consensus.txt', prob)
np.savetxt('6.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_kmeans3_consensus.txt', prob)
np.savetxt('5.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_kmeans3_consensus.txt', prob)
np.savetxt('4.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_kmeans3_consensus.txt', prob)
np.savetxt('3.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_kmeans3_consensus.txt', prob)
np.savetxt('2.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_kmeans3_consensus.txt', prob)
np.savetxt('1.kmeans3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/9_kmeans4_consensus.txt', prob)
np.savetxt('9.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_kmeans4_consensus.txt', prob)
np.savetxt('8.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_kmeans4_consensus.txt', prob)
np.savetxt('7.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_kmeans4_consensus.txt', prob)
np.savetxt('6.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_kmeans4_consensus.txt', prob)
np.savetxt('5.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_kmeans4_consensus.txt', prob)
np.savetxt('4.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_kmeans4_consensus.txt', prob)
np.savetxt('3.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_kmeans4_consensus.txt', prob)
np.savetxt('2.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_kmeans4_consensus.txt', prob)
np.savetxt('1.kmeans4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/9_kmeans5_consensus.txt', prob)
np.savetxt('9.kmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_kmeans5_consensus.txt', prob)
np.savetxt('8.kmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_kmeans5_consensus.txt', prob)
np.savetxt('7.kmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_kmeans5_consensus.txt', prob)
np.savetxt('6.kmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_kmeans5_consensus.txt', prob)
np.savetxt('5.kmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_kmeans5_consensus.txt', prob)
np.savetxt('4.kmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_kmeans5_consensus.txt', prob)
np.savetxt('3.kmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_kmeans5_consensus.txt', prob)
np.savetxt('2.kmeans5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_kmeans5_consensus.txt', prob)
np.savetxt('1.kmeans5.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_q3_consensus.txt', prob)
np.savetxt('9.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_q3_consensus.txt', prob)
np.savetxt('8.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_q3_consensus.txt', prob)
np.savetxt('7.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_q3_consensus.txt', prob)
np.savetxt('6.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_q3_consensus.txt', prob)
np.savetxt('5.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_q3_consensus.txt', prob)
np.savetxt('4.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_q3_consensus.txt', prob)
np.savetxt('3.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_q3_consensus.txt', prob)
np.savetxt('2.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_q3_consensus.txt', prob)
np.savetxt('1.q3.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/9_q4_consensus.txt', prob)
np.savetxt('9.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_q4_consensus.txt', prob)
np.savetxt('8.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_q4_consensus.txt', prob)
np.savetxt('7.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_q4_consensus.txt', prob)
np.savetxt('6.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_q4_consensus.txt', prob)
np.savetxt('5.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_q4_consensus.txt', prob)
np.savetxt('4.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_q4_consensus.txt', prob)
np.savetxt('3.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_q4_consensus.txt', prob)
np.savetxt('2.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_q4_consensus.txt', prob)
np.savetxt('1.q4.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/9_q5_consensus.txt', prob)
np.savetxt('9.q5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/8_q5_consensus.txt', prob)
np.savetxt('8.q5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/7_q5_consensus.txt', prob)
np.savetxt('7.q5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/6_q5_consensus.txt', prob)
np.savetxt('6.q5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/5_q5_consensus.txt', prob)
np.savetxt('5.q5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/4_q5_consensus.txt', prob)
np.savetxt('4.q5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/3_q5_consensus.txt', prob)
np.savetxt('3.q5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/2_q5_consensus.txt', prob)
np.savetxt('2.q5.txt',links, fmt = '%i') 
links = None
links = ReleaseMyself('banjo_pandapas/1_q5_consensus.txt', prob)
np.savetxt('1.q5.txt',links, fmt = '%i') 
links = None


'''
links = ReleaseMyself('banjo_pandapas/9_bikmeans2_consensus.txt', prob)
np.savetxt('9.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_i2_consensus.txt', prob)
np.savetxt('9.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_kmeans2_consensus.txt', prob)
np.savetxt('9.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_max25_consensus.txt', prob)
np.savetxt('9.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_max50_consensus.txt', prob)
np.savetxt('9.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_max75_consensus.txt', prob)
np.savetxt('9.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_mean2_consensus.txt', prob)
np.savetxt('9.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_q2_consensus.txt', prob)
np.savetxt('9.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_TDT_consensus.txt', prob)
np.savetxt('9.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_top25_consensus.txt', prob)
np.savetxt('9.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/9_top75_consensus.txt', prob)
np.savetxt('9.top75.txt',links, fmt = '%i') 
links = None


links = ReleaseMyself('banjo_pandapas/8_bikmeans2_consensus.txt', prob)
np.savetxt('8.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_i2_consensus.txt', prob)
np.savetxt('8.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_kmeans2_consensus.txt', prob)
np.savetxt('8.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_max25_consensus.txt', prob)
np.savetxt('8.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_max50_consensus.txt', prob)
np.savetxt('8.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_max75_consensus.txt', prob)
np.savetxt('8.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_mean2_consensus.txt', prob)
np.savetxt('8.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_q2_consensus.txt', prob)
np.savetxt('8.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_TDT_consensus.txt', prob)
np.savetxt('8.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_top25_consensus.txt', prob)
np.savetxt('8.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/8_top75_consensus.txt', prob)
np.savetxt('8.top75.txt',links, fmt = '%i') 
links = None


links = ReleaseMyself('banjo_pandapas/7_bikmeans2_consensus.txt', prob)
np.savetxt('7.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_i2_consensus.txt', prob)
np.savetxt('7.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_kmeans2_consensus.txt', prob)
np.savetxt('7.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_max25_consensus.txt', prob)
np.savetxt('7.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_max50_consensus.txt', prob)
np.savetxt('7.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_max75_consensus.txt', prob)
np.savetxt('7.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_mean2_consensus.txt', prob)
np.savetxt('7.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_q2_consensus.txt', prob)
np.savetxt('7.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_TDT_consensus.txt', prob)
np.savetxt('7.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_top25_consensus.txt', prob)
np.savetxt('7.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/7_top75_consensus.txt', prob)
np.savetxt('7.top75.txt',links, fmt = '%i') 
links = None



links = ReleaseMyself('banjo_pandapas/6_bikmeans2_consensus.txt', prob)
np.savetxt('6.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_i2_consensus.txt', prob)
np.savetxt('6.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_kmeans2_consensus.txt', prob)
np.savetxt('6.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_max25_consensus.txt', prob)
np.savetxt('6.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_max50_consensus.txt', prob)
np.savetxt('6.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_max75_consensus.txt', prob)
np.savetxt('6.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_mean2_consensus.txt', prob)
np.savetxt('6.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_q2_consensus.txt', prob)
np.savetxt('6.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_TDT_consensus.txt', prob)
np.savetxt('6.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_top25_consensus.txt', prob)
np.savetxt('6.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/6_top75_consensus.txt', prob)
np.savetxt('6.top75.txt',links, fmt = '%i') 
links = None


links = ReleaseMyself('banjo_pandapas/5_bikmeans2_consensus.txt', prob)
np.savetxt('5.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_i2_consensus.txt', prob)
np.savetxt('5.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_kmeans2_consensus.txt', prob)
np.savetxt('5.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_max25_consensus.txt', prob)
np.savetxt('5.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_max50_consensus.txt', prob)
np.savetxt('5.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_max75_consensus.txt', prob)
np.savetxt('5.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_mean2_consensus.txt', prob)
np.savetxt('5.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_q2_consensus.txt', prob)
np.savetxt('5.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_TDT_consensus.txt', prob)
np.savetxt('5.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_top25_consensus.txt', prob)
np.savetxt('5.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/5_top75_consensus.txt', prob)
np.savetxt('5.top75.txt',links, fmt = '%i') 
links = None


links = ReleaseMyself('banjo_pandapas/4_bikmeans2_consensus.txt', prob)
np.savetxt('4.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_i2_consensus.txt', prob)
np.savetxt('4.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_kmeans2_consensus.txt', prob)
np.savetxt('4.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_max25_consensus.txt', prob)
np.savetxt('4.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_max50_consensus.txt', prob)
np.savetxt('4.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_max75_consensus.txt', prob)
np.savetxt('4.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_mean2_consensus.txt', prob)
np.savetxt('4.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_q2_consensus.txt', prob)
np.savetxt('4.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_TDT_consensus.txt', prob)
np.savetxt('4.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_top25_consensus.txt', prob)
np.savetxt('4.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/4_top75_consensus.txt', prob)
np.savetxt('4.top75.txt',links, fmt = '%i') 
links = None


links = ReleaseMyself('banjo_pandapas/3_bikmeans2_consensus.txt', prob)
np.savetxt('3.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_i2_consensus.txt', prob)
np.savetxt('3.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_kmeans2_consensus.txt', prob)
np.savetxt('3.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_max25_consensus.txt', prob)
np.savetxt('3.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_max50_consensus.txt', prob)
np.savetxt('3.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_max75_consensus.txt', prob)
np.savetxt('3.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_mean2_consensus.txt', prob)
np.savetxt('3.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_q2_consensus.txt', prob)
np.savetxt('3.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_TDT_consensus.txt', prob)
np.savetxt('3.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_top25_consensus.txt', prob)
np.savetxt('3.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/3_top75_consensus.txt', prob)
np.savetxt('3.top75.txt',links, fmt = '%i') 
links = None


links = ReleaseMyself('banjo_pandapas/2_bikmeans2_consensus.txt', prob)
np.savetxt('2.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_i2_consensus.txt', prob)
np.savetxt('2.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_kmeans2_consensus.txt', prob)
np.savetxt('2.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_max25_consensus.txt', prob)
np.savetxt('2.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_max50_consensus.txt', prob)
np.savetxt('2.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_max75_consensus.txt', prob)
np.savetxt('2.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_mean2_consensus.txt', prob)
np.savetxt('2.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_q2_consensus.txt', prob)
np.savetxt('2.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_TDT_consensus.txt', prob)
np.savetxt('2.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_top25_consensus.txt', prob)
np.savetxt('2.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/2_top75_consensus.txt', prob)
np.savetxt('2.top75.txt',links, fmt = '%i') 
links = None


links = ReleaseMyself('banjo_pandapas/1_bikmeans2_consensus.txt', prob)
np.savetxt('1.bikmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_i2_consensus.txt', prob)
np.savetxt('1.i2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_kmeans2_consensus.txt', prob)
np.savetxt('1.kmeans2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_max25_consensus.txt', prob)
np.savetxt('1.max25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_max50_consensus.txt', prob)
np.savetxt('1.max50.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_max75_consensus.txt', prob)
np.savetxt('1.max75.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_mean2_consensus.txt', prob)
np.savetxt('1.mean2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_q2_consensus.txt', prob)
np.savetxt('1.q2.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_TDT_consensus.txt', prob)
np.savetxt('1.TDT.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_top25_consensus.txt', prob)
np.savetxt('1.top25.txt',links, fmt = '%i') 
links = None

links = ReleaseMyself('banjo_pandapas/1_top75_consensus.txt', prob)
np.savetxt('1.top75.txt',links, fmt = '%i') 
links = None


'''