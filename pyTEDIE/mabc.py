import numpy as np
import logging

logger = logging.getLogger(__name__)

class MABC:
    """
    Calculates the mean area between curves given two time series.
    """

    # Initializer
    def __init__(self):
        pass

    def calculate(self, data1, data2):
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
                area += self.trapezoid(x1,y1,x2,y2,u1,v1,u2,v2)
        return area

    def trapezoid(self, x1,y1,x2,y2,u1,v1,u2,v2):
        """
        Calculate area between two lines.
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
