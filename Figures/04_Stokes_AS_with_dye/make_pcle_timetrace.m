%% Make intensity-timetrace plots
clear
close all
% Define the names of the files
pcle_stokes = 'power_intensity_6.dat';
bkg_stokes = 'power_intensity_3.dat';
pcle_as = 'power_intensity_5.dat';
bkg_as = 'power_intensity_9.dat';

% Import data
pcle_stokes = importdata(pcle_stokes);
pcle_stokes = pcle_stokes.data;
pcle_stokes(:,2) = sum(pcle_stokes(:,2:end),2)/2;

bkg_stokes = importdata(bkg_stokes);
bkg_stokes = bkg_stokes.data;
bkg_stokes(:,2) = sum(bkg_stokes(:,2:end),2)/2;

pcle_as = importdata(pcle_as);
pcle_as = pcle_as.data;
pcle_as(:,2) = sum(pcle_as(:,2:end),2)/2;

bkg_as = importdata(bkg_as);
bkg_as = bkg_as.data;
bkg_as(:,2) = sum(bkg_as(:,2:end),2)/2;


fg = figure(1);
loglog(pcle_stokes(:,1),pcle_stokes(:,2),'o-','Color','red','DisplayName','Stokes pcle');hold on;
loglog(bkg_stokes(:,1),bkg_stokes(:,2),'o','Color','red','DisplayName','Stokes bkg');
loglog(pcle_as(:,1),pcle_as(:,2),'o-','Color','blue','DisplayName','Anti-Stokes pcle');
loglog(bkg_as(:,1),bkg_as(:,2),'o','Color','blue','DisplayName','Anti-Stokes bkg');

set(fg,'Position',[20 20 800 800])
xlim([min(bkg_as(:,1))*0.9 max(bkg_as(:,1))*1.1])

xlabel('Laser intensity (\mu W)','FontSize',24)
ylabel('Particle brightness (CPS)','FontSize',24)
set(gca,'FontSize',18)
legend('Location','NW');
