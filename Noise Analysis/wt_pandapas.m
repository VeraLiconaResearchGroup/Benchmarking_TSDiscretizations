clc,clear
format short;
alldata = load('pandapas_wt.mat');
original = alldata.original; 

%% following sections are qualification and evaluation together
names = {'i2', 'top75', 'top25','mean'};
n = length(names); % number of discretiation we are testing here


for l = 1:n
    ddata = alldata.(names{l});
    % table(l,:) = ConfusionMTrend(original, ddata);
    table(l,:) = WeightedConfusionMTrend(original, ddata);
    clear ddata; 
end

table
