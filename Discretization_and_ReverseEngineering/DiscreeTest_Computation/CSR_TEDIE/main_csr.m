clc,clear
format long
prompt = 'Where is the data file? Press Enter if using the default data for CSR';
datapath = input(prompt);
if isempty(datapath)
    datapath = 'CSR_orig_disc';
end
original  = csvread( strcat(datapath,'/PKN-ExtLiverBMC2012.csv'),2,30 );

mean_dis = csvread(strcat(datapath, '/mean.csv'),2,30);
bikmeans2 = csvread( strcat(datapath, '/bikmeans.csv'),2,30);
TDT = csvread(strcat(datapath, '/gallo.csv'),2,30);
i2 = csvread(strcat(datapath,'/i2.csv'),2,30);
kmeans2 = csvread(strcat(datapath,'/kmeans.csv'),2,30);
max25 = csvread(strcat(datapath, '/max25.csv'),2,30);
max50 = csvread(strcat(datapath, '/max50.csv'),2,30);
max75 = csvread(strcat(datapath, '/max75.csv'),2,30);
top75 = csvread(strcat(datapath, '/quantile25.csv'),2,30);
top25 = csvread(strcat(datapath, '/quantile75.csv'),2,30);

DiscretizationName = 'bikmeans2';
test_data = eval(DiscretizationName);
%test_data = bikmeans2; % 0.059105271208866   0.137191940008318
%test_data = TDT; % 0.000066178158676   0.073679161595096
%test_data = i2; % 0.000000065676095   0.027578817835261
%test_data = kmeans2; % 0.250307628911636   0.0.139951323129246
%test_data = max25; % 0.000000000000000   0.063747294599778
%test_data = max50; % 0.000000000000000   0.065969348934495
%test_data = max75; % 0.000000000000000   0.073922066530218
%test_data = top75; % 0.042563412932894   0.168663856505423
%test_data = top25; % 0.000000000000000   0.302973307732925

res = original-test_data; 
res = reshape(res, [min(size(res))*max(size(res)),1] );
for j = 1:length(res)
    if isnan(res(j))
            res(j) = rand; % modified on Jun. 29, 2017
    end
end

for i = 1:min(size(original))
    pv(i) = benchmark(original(:,i), test_data(:,i));
end
clear i;
cv(1) = signtest(sort(res));
cv(2) = mean(pv);
clear pv
disp(DiscretizationName)
disp('p value')
cv(1)
disp('mean area between the curve')
cv(2)