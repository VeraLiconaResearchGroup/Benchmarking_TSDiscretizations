clc,clear, clf

clc,clear
alldata = load('pandapas_wt.mat');
original = alldata.original; 
%i2 = alldata.i2; 
mean2 = alldata.mean;
bikmeans4 = alldata.bikmeans4;

N = 53;
figure(1)
plot(Normalization(original(N,:)), 'k'); hold on; 
%plot(Normalization(i2(N, :)), 'r:', 'LineWidth', 4); 
plot(Normalization(mean2(N,:)), 'g--', 'LineWidth', 3);   
plot(Normalization(bikmeans4(N,:)), 'y', 'LineWidth', 1);
legend('original','mean', 'bikmeans4')
ylim([-0.5, 1.5])
hold off