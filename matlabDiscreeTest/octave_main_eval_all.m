% @author Tiffany Jann
% @date August 17, 2017
% @adapted from main_eval_all.m
% @contact jann.tiffany@gmail.com

%%% THIS SCRIPT IS ADAPTED FROM MAIN_EVAL_ALL TO BE COMPATIBLE WITH OCTAVE

clc,clear
format short

%%%%% LOAD DATA %%%%%
% for input file, either use user's own file, or load default example file;
try
    path = input('Please enter the path of your own *.mat file: ', 's');

    if path
        load(path)
        fprintf(['Data file successfully loaded from '])
        disp(path)
        clear path;
        [vn, num_disc_methods] = GetDiscretizationMethods_t(who());
    else
        load('example.mat');
        disp('No file selected. Default file loaded.')
        clear path;
        [vn, num_disc_methods] = GetDiscretizationMethods_t(who());
    end
catch % if user's selected file causes an error
    % load an example data file; keep all the files in the same folder;
    load('example.mat');
    disp('An error occured. Default file loaded.')
    clear file path vn num_disc_methods;
    [vn, num_disc_methods] = GetDiscretizationMethods_t(who());
end

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

vals = cell(num_disc_methods,1); % preallocating space to save computation resources

for i = 1:num_disc_methods
    test_data = normalize_t(eval(vn{i}));

    try
        vals{i, 1} = qualification_t(original, test_data, num_time_series, num_nodes);
    catch
        disp('an error occured. likely, your .mat file is missing the original dataset matrix');
    end
end
disp(vn);
disp(vals);
disp([["[[DISCRETIZATION]]", "[[MEAN AREA BTWN CURVES]]"]; [vn vals]]);

clear i vn vals num_time_series num_nodes num_disc_methods test_data zygote;
