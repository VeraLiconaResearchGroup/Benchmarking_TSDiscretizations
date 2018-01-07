import numpy as np
import math
import os

my_parent_dir = os.getcwd()

filename = my_parent_dir+ '/' + 'DREAM3GoldStandard_InSilicoSize100_Yeast1.txt'

links = np.array([0]*100*100).reshape(100, 100)

with open(filename)as f:
    for line in f:
        content = line.split()
        # content as upstream, downstream, and whether there is a relationship
        if float(content[2]) > 0.5:
            # at this case, there is regulatory relationship between these two genes
            up = content[0].split('G')
            down = content[1].split('G')
            index_up = int(up[1])-1
            index_down = int(down[1])-1
            links[index_up, index_down] = 1

np.savetxt('gsyeast1.txt',links, fmt = '%i')            
