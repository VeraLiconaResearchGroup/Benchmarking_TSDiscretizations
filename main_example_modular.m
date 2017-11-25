% @author Tiffany Jann
% @date August 17, 2017
% @adapted from main_example.m
% @contact jann.tiffany@gmail.com

%%% THIS SCRIPT IS ADAPTED FROM MAIN_EVAL_ALL TO UTILIZE MODULAR FUNCTIONS

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

test_data = normalize_t(test_data);
% %%%%% DATA NORMALIZATION %%%%%
% nouveau = ( test_data - ones(size(test_data)) * min(min(test_data)) ) / (max(max(test_data)) - min(min(test_data)));
% clear test_data;
% test_data = nouveau;
% clear nouveau;

%%%%% COMPUTATIONS %%%%%
val = qualification_t(original, test_data, num_time_series, num_nodes);
if strcmp(val, "failed qualification") == 1
    disp("stop here! qualification failed. choose another discretization method!");
else
    disp("qualification passed! move onto evaluation");
    disp("mean area between the curve: ");
    disp(val);
end

clear test_data zygote num_time_series num_nodes;