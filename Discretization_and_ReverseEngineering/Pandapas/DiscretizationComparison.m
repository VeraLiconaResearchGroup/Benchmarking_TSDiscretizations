clc,clear
noise01 = load('noise01.mat'); 
noise05 = load('noise05.mat'); 
figure(1)
set(gcf, 'color', 'w');
for i = 1:104
    test = noise01.mean2(i,:) - noise01.max50(i,:);
    if (mod(i,13)>0)&&(mod(i,13)<11)
        if max( abs( test ) ) > 0.9
            plot(0:8, noise01.mean2(i,:), 'color', 'c' );
            hold on;
            plot(0:8, noise01.max50(i,:), 'color','m' );
            disp(mod(i,13))
            title('1% of noise, comparison between mean and max50 discretization')
        end
    end
end
hold off

figure(2)
set(gcf, 'color', 'w');
for i = 1:104
    test = noise05.mean2(i,:) - noise05.max50(i,:);
    if (mod(i,13)>0)&&(mod(i,13)<11)
        if max( abs( test ) ) > 0.9
            plot(0:8, noise05.mean2(i,:), 'color', 'c' );
            hold on;
            plot(0:8, noise05.max50(i,:), 'color','m' );
            disp(mod(i,13))
            title('5% of noise, comparison between mean and max50 discretization')
        end
    end
end
hold off

