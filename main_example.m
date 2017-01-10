clc,clear
format short
% load an example data file; keep all the files in the same folder; 
load('example.mat'); 
% put the discretization you are interested in here, make sure that your
% loaded data contains the dataset of interest! 
test_data = eval( 'meanstd');
% data normalization
nouveau = ( test_data-ones(size(test_data))*min(min(test_data)) )/ (max(max(test_data)) - min(min(test_data)));
clear test_data;
test_data = nouveau; 
clear nouveau;
%% qualification
for i = 1:length(original)
    res = original(i,:)-test_data(i,:); 
    rocile(i,1) = signtest(sort(res));
    clear res;
end
zygote(1) = quantile(rocile, 0.25);
clear i rocile;
if zygote <0.01
    disp('stop here! choose another discretization method!');
else 
    disp('qualification passed! move to evaluation')
    %% evaluation
    for i = 1:8
        startt = (i-1)*13+1;
        endd = i*13;
        roche(i,1) = benchmark(original(startt:endd,:)', test_data(startt:endd,:)' );    
        clear startt endd;
    end
    zygote(2) = sum(roche)/8;
    clear i roche;
    disp('mean area between the curve: ')
    disp(zygote(2))
end
clear test_data;
