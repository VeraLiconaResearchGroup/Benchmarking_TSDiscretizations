
function val = mabc_y(original, test_data, num_time_series, num_nodes)

%%%%% EVALUATION %%%%%
for i = 1:num_time_series
    startt = (i-1)*num_nodes+1;
    endd = i*num_nodes;        
    roche(i,1) = benchmark(original(startt:endd,:)', test_data(startt:endd,:)' );    
    clear startt endd;
end

val = sum(roche)/num_time_series;
