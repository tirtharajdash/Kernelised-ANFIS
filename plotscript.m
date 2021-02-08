%plotting script

ds = xlsread('wsn_data.xlsx');

[R, C] = size(ds);

group = ds(:,C);

feat1 = 1; %which two features to plot
feat2 = 2;

figure;
gscatter(ds(:,1),ds(:,2),group)
xlabel(num2str(feat1));
ylabel(num2str(feat2));