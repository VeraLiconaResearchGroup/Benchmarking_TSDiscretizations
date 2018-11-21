clc,clear

format short;
alldata = load('pandapas_wt.mat');
tmpdata01 = load('noise01.mat');
tmpdata05 = load('noise05.mat');
original = alldata.original; 


%% following sections are qualification and evaluation together
names_orig = {'i2', 'top75', 'top25','mean', 'bikmeans5', 'bikmeans4', 'bikmeans3', 'bikmeans2'};
names = {'i2', 'top75', 'top25','mean2', 'bikmeans5', 'bikmeans4', 'bikmeans3', 'bikmeans2'};

n = length(names); % number of discretiation we are testing here


for l = 1:n
    table.original(l,:) = TrendConfusionMatrix(original, alldata.(names_orig{l}));
    table.noise01(l,:) = TrendConfusionMatrix(original, tmpdata01.(names{l}));
    table.noise05(l,:) = TrendConfusionMatrix(original, tmpdata05.(names{l}));
end

table.original
table.noise01
table.noise05
