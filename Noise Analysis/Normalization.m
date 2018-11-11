function f = Normalization(ts)

m1 = max(ts);
m2 = min(ts);

if m1 > m2
    f = (ts - ones(size(ts))*m2)/(m1-m2);
else
    f = zeros(size(ts));
end