import os

my_parent_dir = '/Users/vicki/Desktop/'

#my_parent_dir = 'C:/Users/yuezli/Dropbox/FallRotation_Yuezhe/DREAM3/yeast1/'

#filename = my_parent_dir + 'bikmeans2.txt'
#filename = my_parent_dir + 'i2.txt'
#filename = my_parent_dir + 'kmeans2.txt'
#filename = my_parent_dir + 'max25.txt'
#filename = my_parent_dir + 'max50.txt'
#filename = my_parent_dir + 'max75.txt'
#filename = my_parent_dir + 'mean2.txt'
#filename = my_parent_dir + 'TDT.txt'
#filename = my_parent_dir + 'top25.txt'
#filename = my_parent_dir + 'top75.txt'
filename = my_parent_dir + 'q2.txt'


AResult = [];

with open(filename)as f:
    for line in f:
        content = line.split()
        if content[0] == 'file':
            continue
        else:
            # when it returns a value instead of a file name
            s1 = content[-3].split('(')
            s2 = s1[1]
            if s2 != '-1,':
                # when it is -1, then there is no point in researching this value
                s3 = float(s2[0:11]) # get the score
                upperstream = content[7].split(',')[0]
                # print as upperstream, downstream, score, and time delay to fit the golden standard
                print upperstream, content[5], s3, content[2]
                AResult.append( upperstream )
                AResult.append( content[5] )
                AResult.append( s3 )
                AResult.append( content[2] )
#                AResult.append('\n')

