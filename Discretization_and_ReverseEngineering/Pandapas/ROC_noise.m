clc,clear
%load('noise01_banjo_sesp.mat')
load('noise05_banjo_sesp.mat')
dNameS = {'bikmeans2','i2', 'kmeans2','max25','max50', 'max75', 'mean', 'q2', 'TDT', 'top25', 'top75'};
dNameSS = {'bikmeans3', 'bikmeans4', 'bikmeans5', 'i3','i4', 'i5', 'kmeans3', 'kmeans4', 'kmeans5', 'q3', 'q4', 'q5' };
figure
set(gcf, 'color',[1 1 1]);
subplot(1,2,1)
for j = 1:11
    banjo_auroc(j,1) = aUr0C(sp(j,:), se(j,:));
end
for j = 12:23
    banjo_auroc(j,1) = aUr0C(sp(j,:), se(j,:));
end
clear j se sp;
title('ROC curves of discretization from Banjo 2.2.0')
legend([ dNameS, dNameSS ], 'Location', 'southeast')
xlabel('false positive rate'), ylabel('true positive rate')

%load('noise01_tdbn_sesp.mat')
load('noise05_tdbn_sesp.mat')
subplot(1,2,2)
for j = 1:11
    TDBN_auroc(j,1) = aUr0C(sp(j,:), se(j,:));
end
clear j se sp;
title('ROC curves of discretization from TDBN')
legend(dNameS, 'Location', 'southeast')
xlabel('false positive rate'), ylabel('true positive rate')
clear j se sp;

banjo_auroc
TDBN_auroc


