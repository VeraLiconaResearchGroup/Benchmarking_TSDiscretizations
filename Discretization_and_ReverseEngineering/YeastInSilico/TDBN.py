import numpy as np
import datetime
import math


def condi_probi(point1, point2, data, t):
# point1 as parent point
# point2 as daughter point
# point1 -> point2
	t_length = data.shape[1] - t
	data1 = data[point1-1,0:t_length]
	data2 = data[point2-1,t:t_length+t]
	count11 = 0
	count12 = 0
	count21 = 0
	count22 = 0
	for i in range(0,t_length):
		if data1[i] == 1:
			if data2[i] == 1:
				count11 += 1
			elif data2[i] == 2:
				count12 += 1
		elif data1[i] == 2:
			if data2[i] == 1:
				count21 += 1
			elif data2[i] == 2:
				count22 += 1
	# this is for code control:
	control = count11 + count12 + count21 + count22
	if control != t_length:
		print "CHECK YOUR CODE!"
	#print count11,count12, count21, count22
	condi_pr = np.array([[.01,.01],[.01, .01]], dtype = float)
	if float(count11+count12)>0:
		condi_pr[0,0] = float(count11)/float(count11+count12)
		condi_pr[0,1] = float(count12)/float(count11+count12)
	else: 
		condi_pr[0,0] = 0
		condi_pr[0,1] = 0
	if (count21+count22) >0:
		condi_pr[1,0] = float(count21)/float(count21+count22)
		condi_pr[1,1] = float(count22)/float(count21+count22)
	else: 
		condi_pr[1,0] = 0
		condi_pr[1,1] = 0

	score = 0.00
	for i in range(0,2):
		for j in range(0,2):
			probability = condi_pr[i,j]
			if probability != 0:
				score -= math.log(probability) * probability
			else: score = 1000000000
	return score


def condii_prob(group_2, point2, data, t):
	# group_2 as parent group that contains only 2 points; 
	# point2 is daughter point
	nshape = max(group_2.shape)
	if nshape == 2:
		point11 = group_2[0]
		point12 = group_2[1]
		count111 = 0
		count112 = 0
		count121 = 0
		count122 = 0
		count211 = 0
		count212 = 0
		count221 = 0
		count222 = 0
		t_length = data.shape[1] - t
		data11 = data[point11-1,0:t_length]
		data12 = data[point12-1,0:t_length]
		data2 = data[point2-1,t:t_length+t]
		for i in range(0,t_length):
			if (data11[i] == 1 ) & (data12[i] == 1) & (data2[i] == 1):
				count111 += 1
			elif (data11[i] == 1 ) & (data12[i] == 1) & (data2[i] == 2):
				count112 += 1
			elif (data11[i] == 1 ) & (data12[i] == 2) & (data2[i] == 1):
				count121 += 1
			elif (data11[i] == 1 ) & (data12[i] == 2) & (data2[i] == 2):
				count122 += 1
			elif (data11[i] == 2 ) & (data12[i] == 1) & (data2[i] == 1):
				count211 += 1
			elif (data11[i] == 2 ) & (data12[i] == 1) & (data2[i] == 2):
				count212 += 1
			elif (data11[i] == 2 ) & (data12[i] == 2) & (data2[i] == 1):
				count221 += 1
			elif (data11[i] == 2 ) & (data12[i] == 2) & (data2[i] == 2):
				count222 += 1
		control = count111 + count112 + count121 + count122 + count211 + count212 + count221 + count222
		if control != t_length:
		    print "CHECK YOUR CODE!"
		condi_pr = np.array([[.01,.01],[.01, .01],[.01, .01],[.01, .01]], dtype = float)
		if float(count111+count112) > 0:
	        	condi_pr[0,0] = float(count111)/float(count111+count112)
	        	condi_pr[0,1] = float(count112)/float(count111+count112)
	        else: 
	        	condi_pr[0,0] = 0
	        	condi_pr[0,1] = 0
        	if float(count121+count122) > 0:
		    condi_pr[1,0] = float(count121)/float(count121+count122)
		    condi_pr[1,1] = float(count122)/float(count121+count122)
		else:
			condi_pr[1,0] = 0
			condi_pr[1,1] = 0
	    	if float(count211+count212) > 0:
		    condi_pr[2,0] = float(count211)/float(count211+count212)
		    condi_pr[2,1] = float(count212)/float(count211+count212)
	    	else:
		    condi_pr[2,0] = 0
		    condi_pr[2,1] = 0
	    	if float(count221+count222) > 0:
		    condi_pr[3,0] = float(count221)/float(count221+count222)
		    condi_pr[3,1] = float(count222)/float(count221+count222)
	    	else: 
		    condi_pr[3,0] = 0
		    condi_pr[3,1] = 0
	    	score = 0.00
	    	for i in range(0,4):
		    for j in range(0,2):
		        probability = condi_pr[i,j]
		        if probability != 0:
			        score -= math.log(probability) * probability
			else: 
				score = 1000000000
	    	return score
	else:
		print "error in your input!"
		return 1000000000


def cond_prob(group1, point2, data, t):
	n1 = max(group1.shape)
	if n1 >2:
		scores = np.array([float('nan')]*n1*n1).reshape(n1, n1)
		for i in range(0,n1):
			for j in range(i+1, n1):
				p1 = group1[i]
				p2 = group1[j]
				p = np.array([p1,p2])
				scores[i,j] = condii_prob(p, point2, data, t)
		for i in range(0,n1):
			scores[i,i] = condi_probi(group1[i], point2, data, t)
	else: 
		print "switch to another function!"

	min_score = np.nanmin(scores)
	if min_score < 100000000:
		for i in range(0, n1):
			for j in range(0,n1):
				if scores[i][j] == min_score:
					#print 'row = ', i, 'column = ', j, 'minimum score is ', min_score
					return (min_score,i,j)
					# np.savetxt('scores.txt',scores, fmt = '%1.4g')
	else:
		# suggesting no correlation
		return (-1,-1,-1) 


#data = np.loadtxt("y2.txt", skiprows = 0)


group1 = np.array(range(0,100))

def dataSwitch(filenum, group1):
	filename = "y"+str(filenum)+".txt"
	data = np.loadtxt(filename, skiprows = 0)
	for t in range(0,4):
		for node in range(0,100):
			score = cond_prob(group1, node, data, t)
			print 't = ', t, 'node = ', node, score


##-- only from here comes the real calculation --##


for i in range(1,46):
	print 'file ', i, datetime.datetime.now().time().isoformat()
	dataSwitch(i,group1)

print 'Cong!'

# save the screen for raw result

