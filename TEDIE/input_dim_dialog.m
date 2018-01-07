function [num_time_series, num_nodes] = input_dim_dialog()
prompt = {'Enter number of time series:','Enter number of nodes:'};
dlg_title = 'Data specifications';
num_lines = 1;
defaultans = {'8','13'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
num_time_series = str2double(answer{1,1});
num_nodes = str2double(answer{2,1});