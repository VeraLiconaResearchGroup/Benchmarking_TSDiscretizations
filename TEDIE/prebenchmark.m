function f = prebenchmark(x1,y1,x2,y2,x3,y3,x4,y4)
%% this is written by Yuezhe Li at Oct. 16, 2016
% this is a benchmark dirretization eavluation proposed by Tiffany Jann as a REU student
% this is intend to calculate area between two lines
% line1 = (x1, y1) -- (x2,y2)
% line2 = (x3, y3) -- (x4, y4)
diff1 = y3-y1;
diff2 = y4-y2;
dif = diff1*diff2;
if dif < 0
    % here 2 line intersects somewhere in the middle
    m1 = (y2-y1)/(x2-x1);
    b1 = y1 - m1*x1; 
    m2 = (y4-y3)/(x4-x3);
    b2 = y3 - m2*x3;
    xint = (-1)*(b2 - b1)/(m2-m1);
    area1 = (y3-y1)*abs(xint-x1)/2; 
    area2 = abs(y4-y2)*abs(xint-x2)/2;
    area = area1 + area2; 
else if dif > 0 
        area = ( abs(diff1) + abs(diff2) ) * abs(x2-x1)/2;
    else
        ydif = max( abs(y4-y2), abs(y3-y1) );
        xdif = abs(x2 - x1);
        area = xdif*ydif/2;
    end
end
f = area;
