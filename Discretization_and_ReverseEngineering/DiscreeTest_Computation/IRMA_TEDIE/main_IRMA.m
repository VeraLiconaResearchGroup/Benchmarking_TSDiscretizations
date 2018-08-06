clc,clear
format short
prompt = 'IRMA on time series data or IRMA off time series data? Type in "on" or "off" ';
pathchoice = input(prompt,'s');
if strcmp(pathchoice, 'off')
    prompt2 = 'type in data file; press Enter if using default.';
    datapath = input(prompt2, 's'); 
    if isempty(datapath)
        datapath = 'off_data/';
    end
    addpath(datapath)
    %% for IRMA switch off time series
    original = importdata('original_off.txt');
    bikmeans2 = importdata('bikmeans2.txt');
    bikmeans2 = bikmeans2 - ones(size(bikmeans2));
    bikmeans3 = importdata('bikmeans3.txt');
    bikmeans3 = bikmeans3 - ones(size(bikmeans3));
    bikmeans3 = bikmeans3/2;
    bikmeans4 = importdata('bikmeans4.txt');
    bikmeans4 = bikmeans4 - ones(size(bikmeans4));
    bikmeans4 = bikmeans4/3;
    bikmeans5 = importdata('bikmeans5.txt');
    bikmeans5 = bikmeans5/4;
    TDT = importdata('TDT.txt');
    i2 = importdata('i2.txt');
    i3 = importdata('i3.txt')/2;
    i4 = importdata('i4.txt')/3;
    i5 = importdata('i5.txt')/4;
    kmeans2 = importdata('kmeans2.txt');
    kmeans3 = importdata('kmeans3.txt')/2;
    kmeans4 = importdata('kmeans4.txt')/3;
    kmeans5 = importdata('kmeans5.txt')/4;
    mean = importdata('mean.txt');
    q2 = importdata('q2.txt');
    q3 = importdata('q3.txt')/2;
    q4 = importdata('q4.txt')/3;
    q5 = importdata('q5.txt')/4;
    % fprintf('Qualification');
    for i = 1:5
        poff(i,1) = signtest( original(:,i) - bikmeans2(:,i)  );
        poff(i,2) = signtest( original(:,i) - bikmeans3(:,i)  );
        poff(i,3) = signtest( original(:,i) - bikmeans4(:,i)  );
        poff(i,4) = signtest( original(:,i) - bikmeans5(:,i)  );
        poff(i,5) = signtest( original(:,i) - q4(:,i)  );
        poff(i,6) = signtest( original(:,i) - TDT(:,i) ); 
        poff(i,7) = signtest( original(:,i) - i4(:,i)  );
        poff(i,8) = signtest( original(:,i) - i5(:,i)  );
        poff(i,9) = signtest( original(:,i) - q5(:,i)  );
        poff(i,10) = signtest( original(:,i) - kmeans2(:,i)  );
        poff(i,11) = signtest( original(:,i) - kmeans3(:,i)  );
        poff(i,12) = signtest( original(:,i) - kmeans4(:,i)  );
        poff(i,13) = signtest( original(:,i) - kmeans5(:,i)  );
        poff(i,14) = signtest( original(:,i) - mean(:,i)  );
        poff(i,15) = signtest( original(:,i) - q3(:,i)  );
        poff(i,16) = signtest( original(:,i) - i2(:,i)  );
        poff(i,17) = signtest( original(:,i) - i3(:,i)  );
        poff(i,18) = signtest( original(:,i) - q2(:,i)  );
    end
    pvalue.off = min(poff, [], 1);
    % fprintf('Evaluation'); 
    mabc0ff(1) = benchmark(original, bikmeans2);
    mabc0ff(2) = benchmark(original, bikmeans3);
    mabc0ff(3) = benchmark(original, bikmeans4);
    mabc0ff(4) = benchmark(original, bikmeans5);
    mabc0ff(5) = benchmark(original, q4);
    mabc0ff(6) = benchmark(original, TDT);
    mabc0ff(7) = benchmark(original, i4);
    mabc0ff(8) = benchmark(original, i5);
    mabc0ff(9) = benchmark(original, q5);
    mabc0ff(10) = benchmark(original, kmeans2);
    mabc0ff(11) = benchmark(original, kmeans3);
    mabc0ff(12) = benchmark(original, kmeans4);
    mabc0ff(13) = benchmark(original, kmeans5);
    mabc0ff(14) = benchmark(original, mean);
    mabc0ff(15) = benchmark(original, q3);
    mabc0ff(16) = benchmark(original, i2);
    mabc0ff(17) = benchmark(original, i3);
    mabc0ff(18) = benchmark(original, q2);
    disp('pvalues')
    pvalue.off
    disp('mean area between the curves')
    mabc0ff
end
if strcmp(pathchoice, 'on')
    prompt2 = 'type in data file; press Enter if using default.';
    datapath = input(prompt2, 's'); 
    if isempty(datapath)
        datapath = 'on_data/';
    end
    addpath(datapath)  
    %% for IRMA switch on time series
    original = importdata('original_on.txt');
    bikmeans2 = importdata('bikmeans2.txt');
    bikmeans2 = bikmeans2 - ones(size(bikmeans2));
    bikmeans3 = importdata('bikmeans3.txt');
    bikmeans3 = bikmeans3 - ones(size(bikmeans3));
    bikmeans3 = bikmeans3/2;
    bikmeans4 = importdata('bikmeans4.txt');
    bikmeans4 = bikmeans4 - ones(size(bikmeans4));
    bikmeans4 = bikmeans4/3;
    bikmeans5 = importdata('bikmeans5.txt');
    bikmeans5 = bikmeans5/4;
    TDT = importdata('TDT.txt');
    i2 = importdata('i2.txt');
    i3 = importdata('i3.txt')/2;
    i4 = importdata('i4.txt')/3;
    i5 = importdata('i5.txt')/4;
    kmeans2 = importdata('kmeans2.txt');
    kmeans3 = importdata('kmeans3.txt')/2;
    kmeans4 = importdata('kmeans4.txt')/3;
    kmeans5 = importdata('kmeans5.txt')/4;
    mean = importdata('mean.txt');
    q2 = importdata('q2.txt');
    q3 = importdata('q3.txt')/2;
    q4 = importdata('q4.txt')/3;
    q5 = importdata('q5.txt')/4;
    mean_sd = importdata('mean_sd.txt')/2;
    % fprintf('Qualification');
    for i = 1:5
        pon(i,1) = signtest( original(:,i) - bikmeans2(:,i)  );
        pon(i,2) = signtest( original(:,i) - bikmeans3(:,i)  );
        pon(i,3) = signtest( original(:,i) - bikmeans4(:,i)  );
        pon(i,4) = signtest( original(:,i) - bikmeans5(:,i)  );
        pon(i,5) = signtest( original(:,i) - q4(:,i)  );
        pon(i,6) = signtest( original(:,i) - TDT(:,i) ); 
        pon(i,7) = signtest( original(:,i) - i4(:,i)  );
        pon(i,8) = signtest( original(:,i) - i5(:,i)  );
        pon(i,9) = signtest( original(:,i) - q5(:,i)  );
        pon(i,10) = signtest( original(:,i) - kmeans2(:,i)  );
        pon(i,11) = signtest( original(:,i) - kmeans3(:,i)  );
        pon(i,12) = signtest( original(:,i) - kmeans4(:,i)  );
        pon(i,13) = signtest( original(:,i) - kmeans5(:,i)  );
        pon(i,14) = signtest( original(:,i) - mean(:,i)  );
        pon(i,15) = signtest( original(:,i) - q3(:,i)  );
        pon(i,16) = signtest( original(:,i) - i2(:,i)  );
        pon(i,17) = signtest( original(:,i) - i3(:,i)  );
        pon(i,18) = signtest( original(:,i) - q2(:,i)  );
    end
    pvalue.on = min(pon, [], 1);
    % fprintf('Evaluation'); 
    mabc0n(1) = benchmark(original, bikmeans2);
    mabc0n(2) = benchmark(original, bikmeans3);
    mabc0n(3) = benchmark(original, bikmeans4);
    mabc0n(4) = benchmark(original, bikmeans5);
    mabc0n(5) = benchmark(original, q4);
    mabc0n(6) = benchmark(original, TDT);
    mabc0n(7) = benchmark(original, i4);
    mabc0n(8) = benchmark(original, i5);
    mabc0n(9) = benchmark(original, q5);
    mabc0n(10) = benchmark(original, kmeans2);
    mabc0n(11) = benchmark(original, kmeans3);
    mabc0n(12) = benchmark(original, kmeans4);
    mabc0n(13) = benchmark(original, kmeans5);
    mabc0n(14) = benchmark(original, mean);
    mabc0n(15) = benchmark(original, q3);
    mabc0n(16) = benchmark(original, i2);
    mabc0n(17) = benchmark(original, i3);
    mabc0n(18) = benchmark(original, q2);
    disp('pvalues')
    pvalue.on
    disp('mean area between the curves')
    mabc0n
end
