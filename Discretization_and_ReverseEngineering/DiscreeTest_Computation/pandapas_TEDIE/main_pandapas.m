clc,clear
format short
alldata = load('noise05.mat'); 
%alldata = load('pandapas_wt.mat');

%% following section is for writing new data into txt files that can be utilized for BANJO 2.2.0
% if this feature were needed, then make the two current comment lines runnable
try
    for i = 1:8
        startt = (i-1)*13+1;
        endd = i*13;
        newdata = test_data(startt:endd,:);
%       newdata = newdata + ones(size(newdata)); % for max25 only
        newdata = newdata'; % this is for banjo only, not for TDBN, aka only for bikmeans3-5, kmeans3-5, i3-5, q3-5; 
        fname = ['y', num2str(i), '.txt'];
%        fid = fopen(fname,'w');
        fprintf(fid, '%i %i %i %i %i %i %i %i %i %i %i %i %i \n', newdata);
        fclose(fid);
        clear fid i startt endd newdata;
    end
catch   
end

%% following sections are qualification and evaluation together
names = {'i2', 'top75', 'top25','mean2', 'bikmeans2', 'TDT', 'kmeans2','bikmeans5', 'i4','q2','i5', 'bikmeans4','i3','kmeans5','kmeans4','q5', 'bikmeans3','q4','max25','max50', 'max75', 'kmeans3','q3'};

n = length(names); % number of discretiation we are testing here

for l = 1:n
    test_data = alldata.(names{l});
    % data normalization
    test_data_new = ( test_data-ones(size(test_data))*min(min(test_data)) )/ (max(max(test_data)) - min(min(test_data)));
    test_data = test_data_new; 
    clear test_data_new;
    % qualification
    for i = 1:length(alldata.original)
        res = alldata.original(i,:)-test_data(i,:); 
        pvv(i,1) = signtest(sort(res));
    end
    cv(l,1) = quantile(pvv, 0.25);
    clear i pvv;
    % evaluation
    for i = 1:8
        startt = (i-1)*13+1;
        endd = i*13;
        pv(i,1) = benchmark(alldata.original(startt:endd,:)', test_data(startt:endd,:)' );    
    end
    cv(l,2) = sum(pv)/8;
    clear pv i
end
% cv are the result of interest
names = names';
pvalues = cv(:,1);
[b, ind] = sort(pvalues, 'descend');
newdata = names(ind);
mabc = cv(ind,2);
newdata(:,2) = num2cell(b);
newdata(:,3) = num2cell(mabc);
% first column is discretization name, second column in pvalues from
% qualification step, third column is mean area between the curves in
% evaluation step; 
newdata
% when the second column > 0.01, go to third column and choose the minimum one

