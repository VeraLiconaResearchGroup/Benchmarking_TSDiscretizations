clc,clear
format short
alldata = load('noise05.mat'); 
tmpdata = load('pandapas_wt.mat');
original = tmpdata.original; 
clear tmpdata;


%% following sections are qualification and evaluation together
names = {'i2', 'top75', 'top25','mean2', 'bikmeans5', 'bikmeans4'};
n = length(names); % nucmber of discretiation we are testing here


for l = 1:n
    ddata = alldata.(names{l});
    table(l,:) = ConfusionMTrend(original, ddata);
    %ctable(l,:) = WeightedConfusionMTrend(original, ddata);
    clear ddata; 
end

table
