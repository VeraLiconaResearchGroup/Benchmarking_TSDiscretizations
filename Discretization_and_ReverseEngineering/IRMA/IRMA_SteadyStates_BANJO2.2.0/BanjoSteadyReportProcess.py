import os

def ReleaseMyself(file_path_1):
    gal_q2 = open(file_path_1, 'r')
    readin = gal_q2.readlines()
    net_score = readin[-8] # best network score

    TP = 0
    FP = 0
    total = 0

    wordline = readin[-6] # for node 0
    words = wordline.split()
    if words[0] == '0':
        number_identified = int( words[1] )
        total +=  number_identified
        if number_identified > 0:
            for j in range(2, number_identified+2):
                if int(words[j]) == 2 | 3:
                    TP += 1
                else: 
                    FP += 1

    number_identified = None
    words = None
    wordline = None

    wordline = readin[-5] # for node 1
    words = wordline.split()
    if words[0] == '1':
        number_identified = int( words[1] )
        total +=  number_identified
        if number_identified > 0:
            for j in range(2, number_identified+2):
                if (int(words[j]) == 0 | 4):
                    TP += 1
                else: 
                    FP += 1

    number_identified = None
    words = None
    wordline = None

    wordline = readin[-4] # for node 2
    words = wordline.split()
    if words[0] == '2':
        number_identified = int( words[1] )
        total +=  number_identified
        if number_identified > 0:
            for j in range(2, number_identified+2):
                if int(words[j]) == 1:
                    TP += 1
                else: 
                    FP += 1

    number_identified = None
    words = None
    wordline = None

    wordline = readin[-3] # for node 3
    words = wordline.split()
    if words[0] == '3':
        number_identified = int( words[1] )
        total += number_identified
        if number_identified > 0:
            for j in range(2, number_identified+2):
                if int(words[j]) == 2:
                    TP += 1
                else: 
                    FP += 1


    number_identified = None
    words = None
    wordline = None

    wordline = readin[-2] # for node 4
    words = wordline.split()
    if words[0] == '4':
        number_identified = int( words[1] )
        total += number_identified
        if number_identified > 0:
            for j in range(2, number_identified+2):
                if int(words[j]) == 1 | 2:
                    TP += 1
                else: 
                    FP += 1

    number_identified = None
    words = None
    wordline = None

    print '\nCHECK WHETHER TP + FP == total !!!!'
    print TP
    print FP
    print total
    print 'CHECK WHETHER TP + FP == total !!!! \n'

    if TP+FP == total:
        PPV = float(TP)/float(total)
        se = float(TP)/8
        one_minus_spe = float(FP)/12
        SPE = 1-one_minus_spe
        print 'PPV: ', PPV 
        print 'sensitivity: ', se
        print 'specificity: ', SPE
#        print '\n', file_path_1, '\n'
    else: 
        print 'ERRPR! DO IT AGAIN'

#my_current_dir = os.getcwd()
#my_current_dir = '~/Dropbox/FallRotation_Yuezhe/YeastSynthetic/OTHER+BANJO/mean_std/'

my_current_dir = 'C:/Users/yuezli/Dropbox/FallRotation_Yuezhe/YeastSynthetic/OTHER+BANJO/mean/'

i = 0

filenames = ['NA']*67


for subdir, dirs, files in os.walk(my_current_dir):
    for file in files:
        filenames[i] = file
        i+=1

print filenames[16] # static.data.txt
print filenames[26] # report.2016.09.29.15.07.06.txt
print filenames[27] # report.2016.09.29.17.17.35.txt
print filenames[38] # static.data.txt


print 'Galactose'
print 'Galactose'
print 'Galactose'
print 'Galactose'
print 'Galactose'
print 'Galactose'
print 'Galactose'
print 'Galactose'
print 'Galactose'

for i in range(16,26):
    print i-15
    file_path = my_current_dir + 'Galactose/' + filenames[i]
    ReleaseMyself(file_path)

print 'Glucose'
print 'Glucose'
print 'Glucose'
print 'Glucose'
print 'Glucose'
print 'Glucose'
for i in range(27,37):
    print i-53
    file_path = my_current_dir + 'Glucose/' + filenames[i]
    ReleaseMyself(file_path)

