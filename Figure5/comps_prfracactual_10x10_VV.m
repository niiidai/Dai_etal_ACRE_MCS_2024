clear all;

pr_02 = 0;
mask_pr_02 = 0;

pr_08 = 0; 
mask_pr_08 = 0;

for i = 2001:2017
    load(['Processed3/MCS_PRfracactual_VV_spat_10x10_02_' num2str(i) '.mat']);
    load(['Processed3/MCS_PRfracactual_VV_spat_10x10_08_' num2str(i) '.mat']);
    pr_02 = pr_02 + w_spat_mcs_02;
    pr_08 = pr_08 + w_spat_mcs_08;
    mask_pr_02 = mask_pr_02 + mask_w_mcs_02;
    mask_pr_08 = mask_pr_08 + mask_w_mcs_08;
end

pr_02 = pr_02./mask_pr_02;
pr_08 = pr_08./mask_pr_08;


%%-----------------02------------------------
mo = 4*2+1; mo1 = mo*4;
f1 = figure(2);
clf;
subplot(2,5,1);
lev = [-0.25:0.02:-0.01];
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(:,18,:,1)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(-10,28.5,'(a)','FontSize',15,'fontweight', 'bold');
title('MCS Pr 0-20% (Forg<30%)','FontSize',15)

subplot(2,5,2);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(:,18,:,2)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
text(0,28.5,'(b)','FontSize',15,'fontweight', 'bold');
title('20%-40%','FontSize',15)

subplot(2,5,3);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(:,18,:,3)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
text(0,28.5,'(c)','FontSize',15,'fontweight', 'bold');
title('40%-60%','FontSize',15)

subplot(2,5,4);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(:,18,:,4)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
text(0,28.5,'(d)','FontSize',15,'fontweight', 'bold');
title('60%-80%','FontSize',15)

subplot(2,5,5);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(:,18,:,5)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
text(0,28.5,'(e)','FontSize',15,'fontweight', 'bold');
title('80%-100%','FontSize',15)

subplot(2,5,6);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(:,18,:,1)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(-10,28.5,'(f)','FontSize',15,'fontweight', 'bold');
title('MCS Pr 0-20% (Forg>70%)','FontSize',15)

subplot(2,5,7);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(:,18,:,2)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
text(0,28.5,'(g)','FontSize',15,'fontweight', 'bold');
title('20%-40%','FontSize',15)

subplot(2,5,8);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(:,18,:,3)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
text(0,28.5,'(h)','FontSize',15,'fontweight', 'bold');
title('40%-60%','FontSize',15)

subplot(2,5,9);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(:,18,:,4)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
text(0,28.5,'(i)','FontSize',15,'fontweight', 'bold');
title('60%-80%','FontSize',15)

subplot(2,5,10);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(:,18,:,5)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev,'LineWidth',1.2);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',14)
xlabel('degree (^o)','FontSize',15);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',15);
text(0,28.5,'(j)','FontSize',15,'fontweight', 'bold');
title('80%-100%','FontSize',15)

%%-----------------02------------------------
mo = 4*2+1; mo1 = mo*4;
f1 = figure(2);
clf;
subplot(2,5,1);
lev = [-0.25:0.01:-0.01];
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(18,:,:,1)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('MCS Precip 0-20% (Bottom 30% Forg)','FontSize',13)

lev = [-0.25:0.01:-0.01];
subplot(2,5,2);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(18,:,:,2)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);
title('20%-40%','FontSize',13)

subplot(2,5,3);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(18,:,:,3)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);title('40%-60%','FontSize',13)

subplot(2,5,4);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(18,:,:,4)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);
title('60%-80%','FontSize',13)

subplot(2,5,5);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_02(18,:,:,5)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);
title('80%-100%','FontSize',13)

subplot(2,5,6);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(18,:,:,1)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);
title('MCS Precip 0-20% (Top 30% Forg)','FontSize',13)

subplot(2,5,7);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(18,:,:,2)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);title('20%-40%','FontSize',13)

subplot(2,5,8);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(18,:,:,3)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);
title('40%-60%','FontSize',13)

subplot(2,5,9);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(18,:,:,4)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);
title('60%-80%','FontSize',13)

subplot(2,5,10);
lev1 = [0:5:90];
pr_tmp = flip(squeeze(pr_08(18,:,:,5)),2);
[C,h] = contour(permute(pr_tmp,[2 1]),lev);hold on;
clabel(C,h);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 27]);
set(gca,'FontSize',11)
xlabel('degree (^o)','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:3:27])
yticklabels({'1000','925','850','775','650','500','350','225','150'});
ylabel('hPa','FontSize',13);
title('80%-100%','FontSize',13)


