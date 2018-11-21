clc,clear, clf

alldata = load('pandapas_wt.mat');
original = alldata.original; 
i2 = alldata.i2; 
mean2 = alldata.mean;
bikmeans5 = alldata.bikmeans5;

N = 8;
figure(1)
plot(Normalization(original(N,:)), 'k'); hold on; 
plot(Normalization(i2(N, :)), 'r:', 'LineWidth', 4); 
plot(Normalization(mean2(N,:)), 'g--', 'LineWidth', 3);   
plot(Normalization(bikmeans5(N,:)), 'y', 'LineWidth', 1);
tmp = Normalization(original(N,:));
%scatter(4, tmp(4), 80, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'Marker', 's')

legend('original', 'i2','mean', 'bikmeans5')
ylim([-0.5, 1.5])
hold off