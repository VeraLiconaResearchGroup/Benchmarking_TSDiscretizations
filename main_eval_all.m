% @author Tiffany Jann
% @date August 13, 2017
% @adapted from main_example.m
% @contact jann.tiffany@gmail.com

%%% THIS SCRIPT WILL FIND AUC VALUES FOR ALL DISCRETIZATIONS PROVIDED IN
%%% DATA FILE
%%% runs like main_example.m, without discretization selection
%%% documentation is available for main_example.m

clc,clear
format short

%%%%% LOAD DATA %%%%%
% for input file, either use user's own file, or load default example file;
try
    disp('Load your own *.mat file:  ')
    [file,path] = uigetfile('*.mat');

    if file
        filename = strcat(path, file);
        load(filename)
        fprintf(['data file successfully loaded from '])
        disp(strcat(path, file))
        clear file path filename;
        [vn, num_disc_methods] = GetDiscretizationMethods_t(who());
    else
        load('example.mat');
        disp('no file selected. default file loaded.')
        clear file path;
        [vn, num_disc_methods] = GetDiscretizationMethods_t(who());
    end
catch % if user's selected file causes an error
    % load an example data file; keep all the files in the same folder;
    load('example.mat');
    disp('an error occured. default file loaded.')
    clear file path vn num_disc_methods;
    [vn, num_disc_methods] = GetDiscretizationMethods_t(who());
end
clear file filename path;

% prompt for data dimensions
% default values correspond to default example data
[num_time_series, num_nodes] = input_dim_dialog();


vals = cell(num_disc_methods,1); % preallocating space to save computation resources

for i = 1:num_disc_methods
    test_data = normalize_t(eval(vn{i}));

    try
        vals{i, 1} = qualification_t(original, test_data, num_time_series, num_nodes);
    catch
        disp('an error occured. likely, your .mat file is missing the original dataset matrix');
    end
end

disp([["[[DISCRETIZATION]]", "[[MEAN AREA BTWN CURVES]]"]; [vn vals]]);

clear i vn vals num_time_series num_nodes num_disc_methods test_data zygote;
