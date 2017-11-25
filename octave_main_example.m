% @author Tiffany Jann
% @date August 17, 2017
% @adapted from main_example.m
% @contact jann.tiffany@gmail.com

%%% THIS SCRIPT IS ADAPTED FROM MAIN_EXAMPLE TO BE COMPATIBLE WITH OCTAVE

clc,clear
format short

%%%%% LOAD DATA %%%%%
% for input file, either use user's own file, or load default example file;
try
    prompt = 'Please enter the path of your own *.mat file (hit ENTER for default): ';
    path = input(prompt, 's');

    if path
        load(path)
        fprintf('Data file successfully loaded from ')
        disp(path)
    else
        load('example.mat');
        disp('No file selected. Default file loaded.')
    end
catch % if user's selected file causes an error
    % load an example data file; keep all the files in the same folder;
    load('example.mat');
    disp('An error occured. Default file loaded.')
end
clear prompt path;

%%%%% SELECT DISCRETIZATION %%%%%
% asks user to select from available discretization methods in loaded data
vn = GetDiscretizationMethods(who());
disp('Available discretizations:');
disp(cellstr(transpose(vn)));
DiscMethodChoice = input('Please enter your desired discretization: ', 's');
disp('Discretizaition of Choice: ');
try 
    fprintf(['\t',DiscMethodChoice, '\n']);
    test_data = eval(DiscMethodChoice);
catch
    % if doesn't enter a valid discretization method
    disp(strcat('[', DiscMethodChoice, '] ', ' is not available. Selecting first discretization (', vn{1}, ').'));
    test_data = eval(vn{1});
    disp(vn{1}); % method will be printed, without the tab, distinguishing from deliberate selection
end
clear vn DiscMethodChoice;

% prompt for data dimensions
% default values correspond to default example data
num_time_series = input('Please enter the number of time series per matrix: ', 's');
while isnan(str2double(num_time_series)) || str2double(num_time_series) < 1
    disp('  Error: Invalid number of time series.');
    num_time_series = input('  Please enter a valid number of time series: ', 's');
end
num_time_series = str2double(num_time_series);

num_nodes = input('Please enter the number of nodes in the network: ', 's');
while isnan(str2double(num_nodes)) || str2double(num_nodes) < 1
    disp('  Error: Invalid number of nodes.');
    num_nodes = input('  Please enter a valid number of nodes: ', 's');
end
num_nodes = str2double(num_nodes);

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
catch e
    disp('An error occured. Likely, your .mat file is missing the original dataset matrix. Error message: ');
    disp(e.message);
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
