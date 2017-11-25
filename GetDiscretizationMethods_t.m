function [vn, kk] = GetDiscretizationMethods_t(variablesName)
%% this is section for slecting variable from the MATLAB variable space
%variablesName = who(); 
kk = max(size(variablesName));
vn = cell(kk,1); % preallocating space to save computation resources
for i = 1:kk
    vn{i,1} = char(variablesName(i));
end