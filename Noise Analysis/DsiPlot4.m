clc,clear, clf

alldata = load('pandapas_wt.mat');
tmpdata01 = load('noise01.mat');
tmpdata05 = load('noise05.mat');

% original = tmpdata01.original;
% i2 = tmpdata01.i2; 
% mean2 = tmpdata01.mean2;
% bikmeans5 = tmpdata01.bikmeans5;

original = tmpdata05.original;
i2 = tmpdata05.i2; 
mean2 = tmpdata05.mean2;
bikmeans5 = tmpdata05.bikmeans5;


N = 8;
figure(1)
plot(Normalization(original(N,:)), 'k'); hold on; 
plot(Normalization(i2(N, :)), 'r:', 'LineWidth', 4); 
plot(Normalization(mean2(N,:)), 'g--', 'LineWidth', 3);   
plot(Normalization(bikmeans5(N,:)), 'y', 'LineWidth', 1);
legend('original', 'i2','mean', 'bikmeans5')
ylim([-0.5, 1.5])
hold off