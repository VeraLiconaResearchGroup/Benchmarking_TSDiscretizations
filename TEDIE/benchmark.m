function f = benchmark(data1, data2)
m = size(data1,1); % number of rows
n = size(data1, 2); % number of columns
% replace NaN
data1(isnan(data1)) = 0.5 ;
data2(isnan(data2)) = 0.5 ;
% initialization
area = 0;
for i = 1:n
    for j = 1:m-1
        x1 = j;
        x2 = j+1;
        x3 = x1;
        x4 = x2; 
        y1 = data1(j,i);
        y2 = data1(j+1, i);
        y3 = data2(j,i);
        y4 = data2(j+1, i);
        addarea = prebenchmark(x1,y1,x2,y2,x3,y3,x4,y4);
        area = area + addarea;
    end
end
f = area/(m*n);
