clc,clear
alldata = load('pandapas_wt.mat');
original = alldata.original; 
i2 = alldata.i2; 
%mean2 = alldata.mean;
%top25 = alldata.top25;
top75 = alldata.top75;

N = 15;
figure(1)
plot(Normalization(original(N,:)), 'k'); hold on; 
plot(Normalization(i2(N, :)), 'r:', 'LineWidth', 4); 
%plot(Normalization(mean2(N,:)), 'g--', 'LineWidth', 3);   
%plot(Normalization(top25(N,:)), 'c', 'LineWidth', 2);
plot(Normalization(top75(N,:)), 'y', 'LineWidth', 1);
% add infliction nodes
scatter(2,0, 150, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'Marker', 'h')
scatter(3, Normalization(original(N,3)), 80, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'Marker', 's')
scatter(3,0, 20, 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'y', 'Marker', 'o')
scatter(4,0, 20, 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'y', 'Marker', 'o')
scatter(2,1, 20, 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'y', 'Marker', 'o')
scatter(5,1, 20, 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'y', 'Marker', 'o')
legend('original', 'i2', 'top75')
ylim([-0.5, 1.5])