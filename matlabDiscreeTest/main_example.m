% main function for DiscreeTest 
% @author Yuezhe Li
% @contact yuezheli@gmail.com
clc,clear
format short

%%%%% LOAD DATA %%%%%
% for input file, either use user's own file, or load default example file;
try
    disp('load your own *.mat file: ')
    [file,path] = uigetfile('*.mat');

    if file
        filename = strcat(path, file);
        load(filename)
        fprintf('data file successfully loaded from ')
        disp(strcat(path, file))
    else
        load('example.mat');
        disp('no file selected. default file loaded.')
    end
catch % if user's selected file causes an error
    % load an example data file; keep all the files in the same folder;
    load('example.mat');
    disp('an error occured. default file loaded.')
end
clear file filename path;

% prompt for data dimensions
% default values correspond to default example data
[num_time_series, num_nodes] = input_dim_dialog();

%%%%% SELECT DISCRETIZATION %%%%%
% asks user to select from available discretization methods in loaded data
vn = GetDiscretizationMethods(who());
DiscMethodChoice = choosedialog( vn );
disp('Discretizaition of Choice: ');
try fprintf(['\t',DiscMethodChoice, '\n']);
    test_data = eval(DiscMethodChoice);
catch
    % if user closes the window or cancels before using the dropdown menu
    test_data = eval(vn{1});
    disp(vn{1}); % TDT will be printed, without the tab, distinguishing from deliberate selection
end
clear vn DiscMethodChoice;

%%%%% DATA NORMALIZATION %%%%%
nouveau = ( test_data - ones(size(test_data)) * min(min(test_data)) ) / (max(max(test_data)) - min(min(test_data)));
clear test_data;
test_data = nouveau;
clear nouveau;

%%%%% COMPUTATIONS %%%%%

%%% qualification %%%
len = length(original);
rocile = zeros(len,1); % preallocating space to save computation resources
try
    for i = 1:len
    res = original(i,:) - test_data(i,:);
    rocile(i,1) = signtest(sort(res));
    clear res;
    end
catch
    disp('an error occured. likely, your .mat file is missing the original dataset matrix');
end

zygote(1) = quantile(rocile, 0.25);
clear i rocile len;
if zygote < 0.01
    disp('stop here! qualification failed. choose another discretization method!');
else
    disp('qualification passed! move onto evaluation')

    %%% evaluation %%%
    roche = zeros(num_time_series,1); % preallocating space to save computation resources
    for i = 1:num_time_series
        startt = (i-1)*num_nodes+1;
        endd = i*num_nodes;
        roche(i,1) = benchmark(original(startt:endd,:)', test_data(startt:endd,:)' );
        clear startt endd;
    end
    zygote(2) = sum(roche)/num_time_series;
    clear i roche;
    disp('mean area between the curve: ')
    disp(zygote(2))
end

clear test_data zygote num_time_series num_nodes;
