% @author Tiffany Jann
% @date August 17, 2017
% @adapted from main_example_modular.m
% @contact jann.tiffany@gmail.com

%%% THIS SCRIPT IS ADAPTED FROM MAIN_EXAMPLE_MODULAR TO BE COMPATIBLE WITH OCTAVE

clc,clear
format short

%%%%% LOAD DATA %%%%%
% for input file, either use user's own file, or load default example file;
try
    path = input('Please enter the path of your own *.mat file: ', 's');

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
clear path;

%%%%% SELECT DISCRETIZATION %%%%%
% asks user to select from available discretization methods in loaded data
vn = GetDiscretizationMethods(who());
disp('Available discretizations:');
disp(cellstr(transpose(vn)));
DiscMethodChoice = input('Please enter your desired discretization: ', 's');
disp('Discretizaition of Choice: ');
try fprintf(['\t',DiscMethodChoice, '\n']);
    test_data = eval(DiscMethodChoice);
catch
    % if user closes the window or cancels before using the dropdown menu
    test_data = eval(vn{1});
    disp(vn{1}); % TDT will be printed, without the tab, distinguishing from deliberate selection
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

% %%%%% DATA NORMALIZATION %%%%%
test_data = normalize_t(test_data);

%%%%% COMPUTATIONS %%%%%
val = qualification_t(original, test_data, num_time_series, num_nodes);
if strcmp(val, "failed qualification") == 1
    disp("Stop here! Qualification failed. Choose another discretization method!");
else
    disp("Qualification passed! Moving onto evaluation...");
    disp("Mean area between the curve: ");
    disp(val);
end

clear test_data zygote num_time_series num_nodes;