clc,clear
% this is the script to write everything into files for BANJO/ TDBN to run;
% load('noise01.mat') % 1% noise
 load('noise05.mat') % 5% noise
% bikmeans2=[]; bikmeans3 = []; bikmeans4 = []; bikmeans5 = []; i2=[]; i3=[]; i4=[]; i5=[];kmeans2=[]; kmeans3=[]; kmeans4=[]; kmeans5=[]; max25=[]; max50=[]; max75=[]; mean2=[]; q2=[]; q3=[]; q4=[]; q5=[]; TDT=[]; top25=[]; top75=[]; 
% i2 = abs(i2); i3 = abs(i3); i4 = abs(i4); i5 = abs(i5);
names = {'bikmeans2';'bikmeans3';'bikmeans4';'bikmeans5';'i2';'i3';'i4';'i5';...
    'kmeans2';'kmeans3';'kmeans4';'kmeans5';'max25';'max50';...
    'max75';'mean2';'q2';'q3';'q4';'q5';'TDT';'top25';'top75';};
%% following section is for writing new data into txt files that can be utilized for BANJO 2.2.0
% if this feature were needed, then make the two current comment lines runnable
for l = 1:23
    test_data = eval(names{l});
    mkdir(names{l});
    try
        for i = 1:8
            startt = (i-1)*13+1;
            endd = i*13;
            newdata = test_data(startt:endd,:);
            newdata = newdata'; % this is for banjo only, not for TDBN, aka only for bikmeans3-5, kmeans3-5, i3-5, q3-5; 
            fname = [names{l}, '/y', num2str(i), '.txt'];
            fid = fopen(fname,'w');
            fprintf(fid, '%i %i %i %i %i %i %i %i %i %i %i %i %i \n', newdata);
            fclose(fid);
            clear fid i startt endd newdata;
        end
    catch   
    end
end


