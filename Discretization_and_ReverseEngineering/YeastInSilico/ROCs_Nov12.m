clc,clear
load('SESP_DREAM3.mat')
% SeSp{1,:} are names of discretizations, just for reference; 
% first column: false positive rate; 
% second column: true positive rate (sensitivity);
% in total 11 different discretization methods; 
figure(1)
set(gcf,'color', [1 1 1]);

for i = 1:7
    plot(SeSp{2,i}(:,1), SeSp{2,i}(:,2),  'Color', [i/9 0.5 .5+i/14], 'LineWidth',1 ,'Marker', 'none', 'MarkerSize',4);
    hold on;
end
plot(SeSp{2,8}(:,1), SeSp{2,8}(:,2),  'Color', [1 0 0], 'LineWidth',2 ,'Marker', 'none', 'MarkerSize',4);
for i = 9:11
    plot(SeSp{2,i}(:,1), SeSp{2,i}(:,2),  'Color', [0 (i-6)/5 0], 'LineWidth',1 ,'Marker', 'none', 'MarkerSize',4);
end
xlabel('False Positive Rate'), ylabel('True Positive Rate');
legend(SeSp{1,1:11}, 'Location','southeast')
hold off
title('ROCs of Different Discretization')