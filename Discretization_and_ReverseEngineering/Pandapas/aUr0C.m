function f = aUr0C(specificity, sensitivity)
% both specificity and sensitivity are vectors; 
tp = sensitivity;
fp = ones(size(specificity)) - specificity;
[fp1, io] = sort(fp, 'ascend');
tp1 = tp(io);
k = max(size(tp));
fp2 = [0 fp1 1];
tp2 = [0 tp1 1];
%% plot ROC curve
linst = {'--', '-', '-.'};
linstyr = ceil( rand*2 ) - floor(rand*2)+1;
linsty = linst{linstyr};
plot(fp2, tp2, 'LineWidth', 2, 'LineStyle', linsty)
hold on
%% calculate AUROC
area = 0;
for i = 1:k+1
    auro = abs(fp2(i+1)-fp2(i)) * abs(tp2(i+1)+tp2(i))/2;
    area = auro + area;
    auro = 0;
end
f = area;
