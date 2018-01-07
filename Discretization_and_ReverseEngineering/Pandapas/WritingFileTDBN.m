clc,clear
% this is the script to write everything into files for BANJO/ TDBN to run;
 load('noise01.mat') % 1% noise
% load('noise05.mat') % 5% noise
names = {'bikmeans2';'i2';'kmeans2';'max25';'max50';...
    'max75';'mean2';'q2';'TDT';'top25';'top75';};
%% following section is for writing new data into txt files that can be utilized for BANJO 2.2.0
% if this feature were needed, then make the two current comment lines runnable
for l = 1:11
    test_data = eval(names{l});
    mkdir(['TDBN/',names{l}]);
    try
        for i = 1:8
            startt = (i-1)*13+1;
            endd = i*13;
            newdata = test_data(startt:endd,:);
            newdata = newdata + ones(size(newdata));
            fname = ['TDBN/', names{l}, '/y', num2str(i), '.txt'];
            fid = fopen(fname,'w');
            fprintf(fid, '%i %i %i %i %i %i %i %i %i \n', newdata);
            fclose(fid);
            clear fid i startt endd newdata;
        end
    catch   
    end
end
