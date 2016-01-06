filename = 'scan05.dat';
fignumber = 1;
data = importdata(filename);
data = data.data*10; % The *10 is to have the data as counts/10ms. 

X = linspace(0,20,200);

fg = figure(fignumber);
imagesc(X,X,log10(data));
set(gca,'FontSize',18);
set(fg,'Position',[20 20 800 800])
xlabel('X (\mu m)','FontSize',24);
ylabel('Y (\mu m)','FontSize',24);
C = colorbar();
ylabel(C,'log_{10}(Counts/10ms)','FontSize',24)

%% Make Histograms of intensities
d = reshape(data,1,size(data,1)*size(data,2));
fg = figure(fignumber+2);
set(fg,'Position',[20 20 800 800])
hist(d,20);
set(gca,'FontSize',18);
xlabel('Counts/10ms','FontSize',24);
ylabel('Number of pixels','FontSize',24)