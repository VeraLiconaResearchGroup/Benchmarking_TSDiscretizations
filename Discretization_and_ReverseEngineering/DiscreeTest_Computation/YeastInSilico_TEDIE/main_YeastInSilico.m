clc,clear
format short

prompt = 'Type in data file folder path, hit "Enter" if using the default data \n';
datapath = input(prompt,'s');
if isempty(datapath)
    datapath = 'DiscData';
end
try
    addpath(datapath);
end

names = {'top75'; 'q2'; 'TDT'; 'max75'; 'mean'; 'max25'; ...
    'max50';'bikmeans2'; 'top25'; 'i2'; 'kmeans2'; 'original'};

n =  length(names);

for i = 1:n
    new = csvread([names{i}, '.csv']);
    new = new(:,1:21);
    assignin( 'base', names{i}, new );
    clear new
end
clear i

n = n-1;
for l = 1:n
    res = original - eval(names{l});
    for i = 1:length(res)
        p_values(i,1) = signtest(res(i,:));
    end
    for i = 1:100
        x = linspace(1,100,100)+i;
        pvalues(i) = min(p_values(x));
    end
    pvalue(l,1) = min(pvalues);
    clear res p_values pvalues i x;
    mabc(l,1) = benchmark( original', eval(names{l})' );
end
pvalue
mabc
clear l n;
