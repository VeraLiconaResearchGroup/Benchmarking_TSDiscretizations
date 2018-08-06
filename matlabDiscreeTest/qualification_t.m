%@author Tiffany Jann
%@date August 13, 2017
%@contact jann.tiffany@gmail.com

%%%%% THIS IS A HELPER FUNCTION FOR MAIN SCRIPTS

function val = qualification_t(original, test_data, num_time_series, num_nodes)
const = length(original);
rocile = double(const); % preallocating space to save computation resources
for i = 1:const
    rocile(i) = signtest(original(i,:), test_data(i,:));
end

zygote(1) = quantile(rocile, 0.25);
clear i rocile;
disp(zygote);
if zygote < 0.01
    % disp('stop here! qualification failed.');
    val = "failed qualification";
else 
    % disp('qualification passed! move to evaluation')
    %%%%% EVALUATION %%%%%
    for i = 1:num_time_series
        startt = (i-1)*num_nodes+1;
        endd = i*num_nodes;
        roche(i,1) = benchmark(original(startt:endd,:)', test_data(startt:endd,:)' );    
        clear startt endd;
    end
    zygote(2) = sum(roche)/num_time_series;
    clear i roche;
    % disp('mean area between the curve: ')
    % disp(zygote(2))
    val = zygote(2);
end
