function f = DerivativeTrend(ts)
% this is the function to calculate second order derivative in a discrete signal;
% ts is the discrete signal in a vector;
% this file returns the number of local maximum and local minimum

m = max(size(ts));

% calculate first order derivative
for i = 1:m-1
    d1(i) = ts(i+1) - ts(i);
end

% calculate how many times the "trend" of ts is changed
nadir = 0; 
zenith = 0; 

d2 = sign(d1);

for j = 1:m-2
    if d2(j) == -1
        if d2(j+1) > -0.5
            nadir = nadir + 1;
        end
    else 
        if d2(j) == 1
            if d2(j+1) < 0.5
                zenith = zenith + 1;
            end
        else 
            % this is where d2(j) == 0
            if d2(j+1) > 0
                nadir = nadir + 1;
            else
                if d2(j+1) < 0
                    zenith = zenith + 1;
                end
            end
        end
    end
end



f = [nadir, zenith];
