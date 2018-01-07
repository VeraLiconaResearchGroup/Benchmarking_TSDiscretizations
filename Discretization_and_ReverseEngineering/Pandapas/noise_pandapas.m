clc,clear
format short
load('pandapas_original.mat');
m = size(pandapas_original, 1); % number of time series I am deal with;
n = 0.05;  % noise level

for i = 1:m
    % add different level of noise
    tseries = pandapas_original(i,:);
    mstd = std(tseries);
    lngt = max(size(tseries));
    rndnoise = normrnd( 0, mstd*n, [1,lngt] );
    noise_data(i,:) =  tseries + rndnoise;
    for j =  1:lngt
        while noise_data(i,j) < 0
            noise_data(i,j) = tseries(j) + normrnd( 0, mstd*n); 
        end
    end
    clear tseries mstd rndnoise lngt j;
end

clear i m;
