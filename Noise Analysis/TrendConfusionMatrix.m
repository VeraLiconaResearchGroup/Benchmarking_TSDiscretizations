function f = TrendConfusionMatrix(original, ddata)
m = size(original, 1); % m returns value of total number of time series; 

for j = 1:m
    % in each time series, see how many local maximum and local minimum exist
    original_local(j,:) = DerivativeTrend(original(j,:));
    d_local(j,:) = DerivativeTrend(ddata(j,:));
end

% calculate mismatches due to discretization
% consider zenith as positive, nadir as negative
% FP are zenith only in discretized data but not in the original data, or a
% missed nadir; 
% FN are nadir only in discretized data but not in the original data, or a
% missed zenith

TP = 0; 
FP = 0; 
TN = 0; 
FN = 0; 


for i = 1:m
    nadir_orig = original_local(i,1);
    zenith_orig = original_local(i,2);
    nadir_d = d_local(i,1);
    zenith_d = d_local(i,2);
    % start with false negative
    if nadir_d > nadir_orig
        FN = FN + (nadir_d - nadir_orig);
        TN = TN + nadir_orig;
    else 
        %nadir_d <= nadir_orig
        TN = TN + nadir_d; 
        FP = FP + (nadir_orig - nadir_d); 
    end
    if zenith_d > zenith_orig
        FP = FP + (zenith_d - zenith_orig);
        TP = TP + zenith_orig;
    else 
        % zenith_d <= zenith_orig
        TP = TP + zenith_d;
        FN = FN + (zenith_orig - zenith_d);
    end
    clear nadir_orig zenith_orig nadir_d zenith_d
end

ppv = TP/(TP + FP); % positive predicted value
sensitivity = TP/(TP + FN); 

precision = TP/(TP + FP);
recall = TP/(TP + FN);

if precision + recall > 0
    f1score = precision * recall / (precision + recall);
    f2score = 5* precision * recall / (4 *precision + recall);
else
    f1score = 0;
end

specificity = TN/ (FN + TN);

accuracy = (TP+TN)/(TP+TN+FP+FN); 



f = [TP, FN, FP, TN, ppv, accuracy, sensitivity, specificity, f1score, f2score];

