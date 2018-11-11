clc,clear
alldata = load('pandapas_wt.mat');
original = alldata.original; 
i2 = alldata.i2; 
mean2 = alldata.mean;
top25 = alldata.top25;
top75 = alldata.top75;
N = 15;
figure(1)
plot(Normalization(i2(N, :))); hold on; 
plot(Normalization(top25(N,:)));plot(Normalization(top75(N,:)));
plot(Normalization(mean2(N,:)), ':'); plot(Normalization(original(N,:)));  
legend('i2','top25', 'top75','mean', 'original')