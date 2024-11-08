clear all;

pr_02 = 0; lw_02 = 0; w_02 = 0; mcs_02 = 0; nomcs_02 = 0;
mask_pr_02 = 0; mask_lw_02 = 0; mask_w_02 = 0; mask_mcs_02 = 0; mask_nomcs_02 = 0;

pr_08 = 0; lw_08 = 0; w_08 = 0; mcs_08 = 0; nomcs_08 = 0;
mask_pr_08 = 0; mask_lw_08 = 0; mask_w_08 = 0; mask_mcs_08 = 0; mask_nomcs_08 = 0;

for i = 2001:2017
    load(['Processed3/MCS_PRfracactual_lwcrf_spat_10x10_02_' num2str(i) '.mat']);
    load(['Processed3/MCS_PRfracactual_lwcrf_spat_10x10_08_' num2str(i) '.mat']);
    pr_02 = pr_02 + pr_spat_mcs_02;
    lw_02 = lw_02 + lwcrf_spat_mcs_02;
    w_02 = w_02 + w_spat_mcs_02;
    mcs_02 = mcs_02 + mcs_spat_mcs_02;
    nomcs_02 = nomcs_02 + nomcs_spat_mcs_02;
    pr_08 = pr_08 + pr_spat_mcs_08;
    lw_08 = lw_08 + lwcrf_spat_mcs_08;
    w_08 = w_08 + w_spat_mcs_08;
    mcs_08 = mcs_08 + mcs_spat_mcs_08;
    nomcs_08 = nomcs_08 + nomcs_spat_mcs_08;
    mask_pr_02 = mask_pr_02 + mask_pr_mcs_02;
    mask_lw_02 = mask_lw_02 + mask_lwcrf_mcs_02;
    mask_w_02 = mask_w_02 + mask_w_mcs_02;
    mask_mcs_02 = mask_mcs_02 + mask_mcs_mcs_02;
    mask_nomcs_02 = mask_nomcs_02 + mask_nomcs_mcs_02;
    mask_pr_08 = mask_pr_08 + mask_pr_mcs_08;
    mask_lw_08 = mask_lw_08 + mask_lwcrf_mcs_08;
    mask_w_08 = mask_w_08 + mask_w_mcs_08;
    mask_mcs_08 = mask_mcs_08 + mask_mcs_mcs_08;
    mask_nomcs_08 = mask_nomcs_08 + mask_nomcs_mcs_08;
end

pr_02 = pr_02./mask_pr_02;
lw_02 = lw_02./mask_lw_02;
w_02 = w_02./mask_w_02;
mcs_02 = mcs_02./mask_mcs_02;
nomcs_02 = nomcs_02./mask_nomcs_02;
pr_08 = pr_08./mask_pr_08;
lw_08 = lw_08./mask_lw_08;
w_08 = w_08./mask_w_08;
mcs_08 = mcs_08./mask_mcs_08;
nomcs_08 = nomcs_08./mask_nomcs_08;

lon_ori = transpose(-4:1:4); lat_ori = transpose(-4:1:4);
lon = transpose(-4.375:0.25:4.375); lat = transpose(-4.375:0.25:4.375);
[X_ori,Y_ori] = meshgrid(lat_ori,lon_ori);
[X,Y] = meshgrid(lat,lon);
lw_02_re = zeros(36,36,5);
lw_08_re = zeros(36,36,5);
for i=1:5
    lw_02_re(:,:,i) = interp2(X_ori,Y_ori,double(lw_02(:,:,i)),X,Y,'linear');
    lw_08_re(:,:,i) = interp2(X_ori,Y_ori,double(lw_08(:,:,i)),X,Y,'linear');
end


%%-----------------02------------------------
mo = 4*2+1; mo1 = mo*4;
f1 = figure(2);
clf;
subplot(2,5,1);
lev1 = [0:5:90];
h1 = contourf(lw_02_re(:,:,1),lev1,'LineStyle','none');hold on;
[C,h]= contour(w_02(:,:,1),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_02(:,:,1),lev,'w-');
clabel(C,h,'Color','w');
%contour(mcs_02(:,:,1),'w-');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
% cbh1 = colorbar;
% set(cbh1,'YTick',0:15:90);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(-11.5,39,'(a)','FontSize',15,'fontweight', 'bold');
title('Forg<30%; MCS Precip of 0-20%','FontSize',15)

lev = [0.88:0.02:0.92];
subplot(2,5,2);
lev1 = [0:5:90];
h1 = contourf(lw_02_re(:,:,2),lev1,'LineStyle','none');hold on;
[C,h]= contour(w_02(:,:,2),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_02(:,:,2),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(0,39,'(b)','FontSize',15,'fontweight', 'bold');
title('20%-40%','FontSize',15);

subplot(2,5,3);
lev1 = [0:5:90];
h1 = contourf(lw_02_re(:,:,3),lev1,'LineStyle','none');hold on;
lev = [0.91 0.91];
[C,h]= contour(w_02(:,:,3),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_02(:,:,3),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(0,39,'(c)','FontSize',15,'fontweight', 'bold');
title('40%-60%','FontSize',15)

subplot(2,5,4);
lev1 = [0:5:90];
h1 = contourf(lw_02_re(:,:,4),lev1,'LineStyle','none');hold on;
lev = [0.91 0.91];
[C,h]= contour(w_02(:,:,4),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_02(:,:,4),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(0,39,'(d)','FontSize',15,'fontweight', 'bold');
title('60%-80%','FontSize',15)

subplot(2,5,5);
lev1 = [0:5:90];
h1 = contourf(lw_02_re(:,:,5),lev1,'LineStyle','none');hold on;
lev = [0.91 0.91];
[C,h]= contour(w_02(:,:,5),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_02(:,:,5),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(0,39.2,'(e)','FontSize',15,'fontweight', 'bold');
title('80%-100%','FontSize',15)

subplot(2,5,6);
lev1 = [0:5:90];
h1 = contourf(lw_08_re(:,:,1),lev1,'LineStyle','none');hold on;
[C,h]= contour(w_08(:,:,1),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_08(:,:,1),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(-11.5,39.2,'(f)','FontSize',15,'fontweight', 'bold');
title('Forg>70%; MCS Precip of 0-20%','FontSize',15)

subplot(2,5,7);
lev1 = [0:5:90];
h1 = contourf(lw_08_re(:,:,2),lev1,'LineStyle','none');hold on;
[C,h]= contour(w_08(:,:,2),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_08(:,:,2),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(0,39.2,'(g)','FontSize',15,'fontweight', 'bold');
title('20%-40% ','FontSize',15)

subplot(2,5,8);
lev1 = [0:5:90];
h1 = contourf(lw_08_re(:,:,3),lev1,'LineStyle','none');hold on;
[C,h]= contour(w_08(:,:,3),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_08(:,:,3),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(0,39.2,'(h)','FontSize',15,'fontweight', 'bold');
title('40%-60%','FontSize',15)

subplot(2,5,9);
lev1 = [0:5:90];
h1 = contourf(lw_08_re(:,:,4),lev1,'LineStyle','none');hold on;
[C,h]= contour(w_08(:,:,4),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_08(:,:,4),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(0,39.2,'(i)','FontSize',15,'fontweight', 'bold');
title('60%-80%','FontSize',15)

subplot(2,5,10);
lev1 = [0:5:90];
h1 = contourf(lw_08_re(:,:,5),lev1,'LineStyle','none');hold on;
[C,h]= contour(w_08(:,:,5),'LineWidth',1);
clabel(C,h);
lev = [0.3:0.1:0.7];
[C,h]= contour(mcs_08(:,:,5),lev,'w-');
clabel(C,h,'Color','w');
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo1 1 mo1]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([0:9:mo1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([0:9:mo1])
yticklabels({'-5','-2.5','0','2.5','5'});
%colorbar;
xlabel('degree (^o)','FontSize',15);
ylabel('degree (^o)','FontSize',15);
set(gca,'FontSize',14)
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
text(0,39.2,'(j)','FontSize',15,'fontweight', 'bold');
title('80%-100%','FontSize',15)


%%-----------------02------------------------
mo = 4*2+1; mo1 = mo*4;
f1 = figure(2);
clf;
subplot(2,5,1);
lev = [0.88:0.02:0.92];
lev1 = [-0.08:-0.001:-0.03];
h1 = contourf(w_02(:,:,1),lev1,'LineStyle','none');hold on;
contour(nomcs_02(:,:,1),lev,'k-','LineWidth',2);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([-0.08 -0.03]);
cbh1 = colorbar;
set(cbh1,'YTick',-0.08:0.02:-0.03);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('MCS (Forg < 0.3) <5 mm/hr','FontSize',13)

lev = [0.88:0.02:0.92];
subplot(2,5,2);
lev1 = [0:5:90];
h1 = contourf(w_02(:,:,2),lev1,'LineStyle','none');hold on;
contour(nomcs_02(:,:,2),lev,'k-','LineWidth',2);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('5-10 mm/hr','FontSize',13)

subplot(2,5,3);
lev1 = [0:5:90];
h1 = contourf(w_02(:,:,3),lev1,'LineStyle','none');hold on;
lev = [0.91 0.91];
contour(nomcs_02(:,:,3),lev,'k-','LineWidth',2);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('10-15 mm/hr','FontSize',13)

subplot(2,5,4);
lev1 = [0:5:90];
h1 = contourf(w_02(:,:,4),lev1,'LineStyle','none');hold on;
lev = [0.91 0.91];
contour(nomcs_02(:,:,4),lev,'k-','LineWidth',2);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('15-20 mm/day','FontSize',13)

subplot(2,5,5);
lev1 = [0:5:90];
h1 = contourf(w_02(:,:,5),lev1,'LineStyle','none');hold on;
lev = [0.91 0.91];
contour(nomcs_02(:,:,5),lev,'k-','LineWidth',2);
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('>20 mm/hr','FontSize',13)

subplot(2,5,6);
lev1 = [0:5:90];
h1 = contourf(w_08(:,:,1),lev1,'LineStyle','none');hold on;
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('MCS (Forg > 0.6) <5 mm/hr','FontSize',13)

subplot(2,5,7);
lev1 = [0:5:90];
h1 = contourf(w_08(:,:,2),lev1,'LineStyle','none');hold on;
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('5-10 mm/hr','FontSize',13)

subplot(2,5,8);
lev1 = [0:5:90];
h1 = contourf(w_08(:,:,3),lev1,'LineStyle','none');hold on;
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('10-15 mm/hr','FontSize',13)

subplot(2,5,9);
lev1 = [0:5:90];
h1 = contourf(w_08(:,:,4),lev1,'LineStyle','none');hold on;
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('15-20 mm/hr','FontSize',13)

subplot(2,5,10);
lev1 = [0:5:90];
h1 = contourf(w_08(:,:,5),lev1,'LineStyle','none');hold on;
% cb1 = (0:1:100);
% colorscheme1 = othercolor('YlGnBu9',length(Y1));
% colormap(gca,colorscheme1);hold on;
% caxis([0 100])
% cbh1 = colorbar;
% set(cbh1,'YTick',0:2.50:2.50);
axis([1 mo 1 mo]);
set(gca,'FontSize',11)
caxis([0 90]);
%xlabel('COP','FontSize',13);
xticks([1:2:mo+1])
xticklabels({'-5','-2.5','0','2.5','5'});
yticks([1:2:mo+1])
yticklabels({'-5','-2.5','0','2.5','5'});
colorbar;
%ylabel('SWCRE (W/m^2)','FontSize',13);
%legend({'MCS','top 25%','bot 25%'},'FontSize',13,'Location','south','LineWidth',2);
title('>20 mm/hr','FontSize',13)
