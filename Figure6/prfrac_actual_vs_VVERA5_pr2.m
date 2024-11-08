%with zero rain pixels
%clear all;
addpath('../Shared');
addpath('../Project4');
load('pr_all_bin.mat');
load('prfrac_bin.mat');

%%----------------10x10------------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
VVERA5_mcs_all = [];
VVERA5_nonmcs_all = [];
VVERA5_nonmcs_dry2_all = [];
VVERA5_nonmcs_pr2_all = [];

for i = 1:3
    load(['Processed3/pr_mcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_new_' num2str(i) '.mat']);
    pr_mcs_all = cat(1,pr_mcs_all,pr_mcs);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    VVERA5_mcs_all = cat(1,VVERA5_mcs_all,vv_mcs);
    VVERA5_nonmcs_all = cat(1,VVERA5_nonmcs_all,vv_nonmcs);
    VVERA5_nonmcs_dry2_all = cat(1,VVERA5_nonmcs_dry2_all,vv_nonmcs_dry2);
    VVERA5_nonmcs_pr2_all = cat(1,VVERA5_nonmcs_pr2_all,vv_nonmcs_pr2);
end

VVERA5_mcs_bin1 = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_bin1 = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_dry2_bin1 = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_pr2_bin1 = zeros(numel(pr_all_bin),numel(prfrac_bin));

VVERA5_mcs_bin1_ct = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_bin1_ct = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_dry2_bin1_ct = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_pr2_bin1_ct = zeros(numel(pr_all_bin),numel(prfrac_bin));

VVERA5_mcs_bin1_ctfr = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_bin1_ctfr = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_dry2_bin1_ctfr = zeros(numel(pr_all_bin),numel(prfrac_bin));
VVERA5_nonmcs_pr2_bin1_ctfr = zeros(numel(pr_all_bin),numel(prfrac_bin));

for i= 1:numel(pr_all_bin)-1
    mask = pr_mcs_all > pr_all_bin(i) & pr_mcs_all <= pr_all_bin(i+1);
    [VVERA5_mcs_bin1(i,:), VVERA5_mcs_bin1_ct(i,:), VVERA5_mcs_bin1_ctfr(i,:)] = cal_prvar(prfrac_bin, prfrac_mcs_all(mask), VVERA5_mcs_all(mask));
    [VVERA5_nonmcs_bin1(i,:), VVERA5_nonmcs_bin1_ct(i,:), VVERA5_nonmcs_bin1_ctfr(i,:)] = cal_prvar(prfrac_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_all(mask));
    [VVERA5_nonmcs_dry2_bin1(i,:), VVERA5_nonmcs_dry2_bin1_ct(i,:), VVERA5_nonmcs_dry2_bin1_ctfr(i,:)] = cal_prvar(prfrac_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_dry2_all(mask));
    [VVERA5_nonmcs_pr2_bin1(i,:), VVERA5_nonmcs_pr2_bin1_ct(i,:), VVERA5_nonmcs_pr2_bin1_ctfr(i,:)] = cal_prvar(prfrac_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_pr2_all(mask));

end
mask = pr_mcs_all > pr_all_bin(10) & pr_mcs_all <= max(pr_mcs_all);
    [VVERA5_mcs_bin1(10,:), VVERA5_mcs_bin1_ct(10,:), VVERA5_mcs_bin1_ctfr(10,:)] = cal_prvar(prfrac_bin, prfrac_mcs_all(mask), VVERA5_mcs_all(mask));
    [VVERA5_nonmcs_bin1(10,:), VVERA5_nonmcs_bin1_ct(10,:), VVERA5_nonmcs_bin1_ctfr(10,:)] = cal_prvar(prfrac_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_all(mask));
    [VVERA5_nonmcs_dry2_bin1(10,:), VVERA5_nonmcs_dry2_bin1_ct(10,:), VVERA5_nonmcs_dry2_bin1_ctfr(10,:)] = cal_prvar(prfrac_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_dry2_all(mask));
    [VVERA5_nonmcs_pr2_bin1(10,:), VVERA5_nonmcs_pr2_bin1_ct(10,:), VVERA5_nonmcs_pr2_bin1_ctfr(10,:)] = cal_prvar(prfrac_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_pr2_all(mask));


%%----------------20x20------------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
VVERA5_mcs_all = [];
VVERA5_nonmcs_all = [];
VVERA5_nonmcs_dry2_all = [];
VVERA5_nonmcs_pr2_all = [];

for i = 1:3
    load(['Processed/recentered/pr_mcs_20x20_new_' num2str(i) '.mat']);
    load(['Processed/recentered/pr_nonmcs_20x20_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_20x20_actual_' num2str(i) '.mat']);
    load(['Processed/recentered/VVERA5_mcs_20x20_' num2str(i) '.mat']);
    load(['Processed/recentered/VVERA5_nonmcs_20x20_' num2str(i) '.mat']);
    load(['Processed/recentered/VVERA5_nonmcs_dry2_20x20_' num2str(i) '.mat']);
    load(['Processed/recentered/VVERA5_nonmcs_pr2_20x20_' num2str(i) '.mat']);
    pr_mcs_all = cat(1,pr_mcs_all,pr_mcs);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    VVERA5_mcs_all = cat(1,VVERA5_mcs_all,VVERA5_mcs);
    VVERA5_nonmcs_all = cat(1,VVERA5_nonmcs_all,VVERA5_nonmcs);
    VVERA5_nonmcs_dry2_all = cat(1,VVERA5_nonmcs_dry2_all,VVERA5_nonmcs_dry2);
    VVERA5_nonmcs_pr2_all = cat(1,VVERA5_nonmcs_pr2_all,VVERA5_nonmcs_pr2);
end

pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
prfrac_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];

VVERA5_mcs_bin2 = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_bin2 = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_dry2_bin2 = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_pr2_bin2 = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));

VVERA5_mcs_bin2_ct = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_bin2_ct = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_dry2_bin2_ct = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_pr2_bin2_ct = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));

VVERA5_mcs_bin2_ctfr = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_bin2_ctfr = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_dry2_bin2_ctfr = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_pr2_bin2_ctfr = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));

for i= 1:numel(pr_mcs_bin)-1
    mask = pr_mcs_all > pr_mcs_bin(i) & pr_mcs_all <= pr_mcs_bin(i+1);
    [VVERA5_mcs_bin2(i,:), VVERA5_mcs_bin2_ct(i,:), VVERA5_mcs_bin2_ctfr(i,:)] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all(mask), VVERA5_mcs_all(mask));
    [VVERA5_nonmcs_bin2(i,:), VVERA5_nonmcs_bin2_ct(i,:), VVERA5_nonmcs_bin2_ctfr(i,:)] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_all(mask));
    [VVERA5_nonmcs_dry2_bin2(i,:), VVERA5_nonmcs_dry2_bin2_ct(i,:), VVERA5_nonmcs_dry2_bin2_ctfr(i,:)] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_dry2_all(mask));
    [VVERA5_nonmcs_pr2_bin2(i,:), VVERA5_nonmcs_pr2_bin2_ct(i,:), VVERA5_nonmcs_pr2_bin2_ctfr(i,:)] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_pr2_all(mask));

end

%%----------------30x30------------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
VVERA5_mcs_all = [];
VVERA5_nonmcs_all = [];
VVERA5_nonmcs_dry2_all = [];
VVERA5_nonmcs_pr2_all = [];

for i = 1:3
    load(['Processed/recentered/pr_mcs_30x30_new_' num2str(i) '.mat']);
    load(['Processed/recentered/pr_nonmcs_30x30_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_30x30_actual_' num2str(i) '.mat']);
    load(['Processed/recentered/VVERA5_mcs_30x30_' num2str(i) '.mat']);
    load(['Processed/recentered/VVERA5_nonmcs_30x30_' num2str(i) '.mat']);
    load(['Processed/recentered/VVERA5_nonmcs_dry2_30x30_' num2str(i) '.mat']);
    load(['Processed/recentered/VVERA5_nonmcs_pr2_30x30_' num2str(i) '.mat']);
    pr_mcs_all = cat(1,pr_mcs_all,pr_mcs);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    VVERA5_mcs_all = cat(1,VVERA5_mcs_all,VVERA5_mcs);
    VVERA5_nonmcs_all = cat(1,VVERA5_nonmcs_all,VVERA5_nonmcs);
    VVERA5_nonmcs_dry2_all = cat(1,VVERA5_nonmcs_dry2_all,VVERA5_nonmcs_dry2);
    VVERA5_nonmcs_pr2_all = cat(1,VVERA5_nonmcs_pr2_all,VVERA5_nonmcs_pr2);
end

pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
prfrac_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];

VVERA5_mcs_bin3 = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_bin3 = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_dry2_bin3 = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_pr2_bin3 = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));

VVERA5_mcs_bin3_ct = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_bin3_ct = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_dry2_bin3_ct = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_pr2_bin3_ct = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));

VVERA5_mcs_bin3_ctfr = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_bin3_ctfr = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_dry2_bin3_ctfr = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));
VVERA5_nonmcs_pr2_bin3_ctfr = zeros(numel(pr_mcs_bin),numel(prfrac_mcs_bin));

for i= 1:numel(pr_mcs_bin)-1
    mask = pr_mcs_all > pr_mcs_bin(i) & pr_mcs_all <= pr_mcs_bin(i+1);
    [VVERA5_mcs_bin3(i,:), VVERA5_mcs_bin3_ct(i,:), VVERA5_mcs_bin3_ctfr(i,:)] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all(mask), VVERA5_mcs_all(mask));
    [VVERA5_nonmcs_bin3(i,:), VVERA5_nonmcs_bin3_ct(i,:), VVERA5_nonmcs_bin3_ctfr(i,:)] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_all(mask));
    [VVERA5_nonmcs_dry2_bin3(i,:), VVERA5_nonmcs_dry2_bin3_ct(i,:), VVERA5_nonmcs_dry2_bin3_ctfr(i,:)] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_dry2_all(mask));
    [VVERA5_nonmcs_pr2_bin3(i,:), VVERA5_nonmcs_pr2_bin3_ct(i,:), VVERA5_nonmcs_pr2_bin3_ctfr(i,:)] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all(mask), VVERA5_nonmcs_pr2_all(mask));

end

%%-------------------------------------
VVERA5_mcs_bin1(VVERA5_mcs_bin1_ct<30)=NaN;
VVERA5_nonmcs_bin1(VVERA5_nonmcs_bin1_ct<30)=NaN;
xt = (0:1:10);
yt = (0:1:10);

figure(1)
clf;
subplot(3,3,1);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen(VVERA5_mcs_bin1,cb1,'YlOrBr9');

colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE in MCS (10x10 deg)');
title(tn,'FontSize',13);

subplot(3,3,2);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen(VVERA5_nonmcs_bin1,cb1,'YlOrBr9');

colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE in Non-MCS (10x10 deg)');
title(tn,'FontSize',13);

subplot(3,3,3);
cb1 = (0:1:90);
Y1 = gridcolor_gen(VVERA5_mcs_bin1-VVERA5_nonmcs_bin1,cb1,'YlOrBr9');

colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([0 90])
cbh1 = colorbar;
set(cbh1,'YTick',0:20:90);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE Diff (10^ox10^o)');
title(tn,'FontSize',13);


VVERA5_mcs_bin2(VVERA5_mcs_bin2_ct<30)=NaN;
VVERA5_nonmcs_bin2(VVERA5_nonmcs_bin2_ct<30)=NaN;
subplot(3,3,4);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen(VVERA5_mcs_bin2,cb1,'YlOrBr9');
colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE in MCS (20^ox20^o)');
title(tn,'FontSize',13);

subplot(3,3,5);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen(VVERA5_nonmcs_bin2,cb1,'YlOrBr9');

colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE in Non-MCS (20^ox20^o)');
title(tn,'FontSize',13);

subplot(3,3,6);
cb1 = (0:1:90);
Y1 = gridcolor_gen(VVERA5_mcs_bin2-VVERA5_nonmcs_bin2,cb1,'YlOrBr9');

colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([0 90])
cbh1 = colorbar;
set(cbh1,'YTick',0:20:90);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE Diff (20^ox20^o)');
title(tn,'FontSize',13);

VVERA5_mcs_bin3(VVERA5_mcs_bin3_ct<30)=NaN;
VVERA5_nonmcs_bin3(VVERA5_nonmcs_bin3_ct<30)=NaN;
subplot(3,3,7);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen(VVERA5_mcs_bin3,cb1,'YlOrBr9');
colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE in MCS (30^ox30^o)');
title(tn,'FontSize',13);

subplot(3,3,8);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen(VVERA5_nonmcs_bin3,cb1,'YlOrBr9');

colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE in Non-MCS (30^ox30^o)');
title(tn,'FontSize',13);

subplot(3,3,9);
cb1 = (0:1:90);
Y1 = gridcolor_gen(VVERA5_mcs_bin3-VVERA5_nonmcs_bin3,cb1,'YlOrBr9');

colorscheme1 = othercolor('YlOrBr9',length(Y1));
colormap(gca,colorscheme1);hold on;
caxis([0 90])
cbh1 = colorbar;
set(cbh1,'YTick',0:20:90);
axis([0 length(xt)-1 0 length(yt)-1]) 
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('CERES LWACRE Diff (30^ox30^o)');
title(tn,'FontSize',13);


%%-----------------------------------
%%-------------------------------------
VVERA5_mcs_bin1(VVERA5_mcs_bin1_ct<30)=NaN;
VVERA5_nonmcs_dry2_bin1(VVERA5_nonmcs_dry2_bin1_ct<30)=NaN;
VVERA5_nonmcs_pr2_bin1(VVERA5_nonmcs_pr2_bin1_ct<30)=NaN;
xt = (0:1:10);
yt = (0:1:10);

figure(1)
clf;
subplot(2,5,1);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin1,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
%cbh1 = colorbar;
%set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylabel('Forg Percentile (%)','FontSize',13);
xlabel('Mean Precip Percentile (%)','FontSize',13);
text(0,10.7,'(a)','FontSize',15,'fontweight', 'bold');
tn = strcat('ERA5 \omega_5_0_0 in MCS');
title(tn,'FontSize',13);

subplot(2,5,3);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_nonmcs_pr2_bin1,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
%cbh1 = colorbar;
%set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylabel('Forg Percentile (%)','FontSize',13);
xlabel('Mean Precip Percentile (%)','FontSize',13);
text(0,10.7,'(c)','FontSize',15,'fontweight', 'bold');
tn = strcat('Non-MCS (PR>2mm/hr)');
title(tn,'FontSize',13);

subplot(2,5,2);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_nonmcs_dry2_bin1,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
%cbh1 = colorbar;
%set(cbh1,'YTick',-0.1:0.025:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylabel('Forg Percentile (%)','FontSize',13);
xlabel('Mean Precip Percentile (%)','FontSize',13);
text(0,10.7,'(b)','FontSize',15,'fontweight', 'bold');
tn = strcat('Non-MCS (PR<2mm/hr)');
title(tn,'FontSize',13);

subplot(2,5,5);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin1-VVERA5_nonmcs_pr2_bin1,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.05:0,'FontSize',11);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylabel('Forg Percentile (%)','FontSize',13);
xlabel('Mean Precip Percentile (%)','FontSize',13);
text(0,10.7,'(e)','FontSize',15,'fontweight', 'bold');
tn = strcat('Diff Between (a) and (c)');
title(tn,'FontSize',13);

subplot(2,5,4);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin1-VVERA5_nonmcs_dry2_bin1,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
%cbh1 = colorbar;
%set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylabel('Forg Percentile (%)','FontSize',13);
xlabel('Mean Precip Percentile (%)','FontSize',13);
text(0,10.7,'(d)','FontSize',15,'fontweight', 'bold');
tn = strcat('Diff Between (a) and (b)');
title(tn,'FontSize',13);


VVERA5_mcs_bin2(VVERA5_mcs_bin2_ct<30)=NaN;
VVERA5_nonmcs_dry2_bin2(VVERA5_nonmcs_dry2_bin2_ct<30)=NaN;
VVERA5_nonmcs_pr2_bin2(VVERA5_nonmcs_pr2_bin2_ct<30)=NaN;
xt = (0:1:10);
yt = (0:1:10);

subplot(3,5,6);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin2,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('ERA5 \omega_5_0_0 in MCS (20^ox20^o)');
title(tn,'FontSize',13);

subplot(3,5,8);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_nonmcs_pr2_bin2,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('Non-MCS (PR>2mm/hr,20^ox20^o)');
title(tn,'FontSize',13);

subplot(3,5,7);
cb1 = (-0.1:0.005:0);
Y1 = gridcolor_gen_rev(VVERA5_nonmcs_dry2_bin2,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.1 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.1:0.025:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('Non-MCS (PR<2mm/hr,20^ox20^o)');
title(tn,'FontSize',13);

subplot(3,5,10);
cb1 = (-0.1:0.005:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin2-VVERA5_nonmcs_pr2_bin2,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.1 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.1:0.025:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('Diff Non-MCS (PR>2mm/hr,20^ox20^o)');
title(tn,'FontSize',13);

subplot(3,5,9);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin2-VVERA5_nonmcs_dry2_bin2,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('Diff Non-MCS (PR<2mm/hr,20^ox20^o)');
title(tn,'FontSize',13);

VVERA5_mcs_bin3(VVERA5_mcs_bin3_ct<30)=NaN;
VVERA5_nonmcs_dry2_bin3(VVERA5_nonmcs_dry2_bin3_ct<30)=NaN;
VVERA5_nonmcs_pr2_bin3(VVERA5_nonmcs_pr2_bin3_ct<30)=NaN;
xt = (0:1:10);
yt = (0:1:10);

subplot(3,5,11);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin3,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('ERA5 \omega_5_0_0 in MCS (30^ox30^o)');
title(tn,'FontSize',13);

subplot(3,5,13);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_nonmcs_pr2_bin3,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('Non-MCS (PR>2mm/hr,30^ox30^o)');
title(tn,'FontSize',13);

subplot(3,5,12);
cb1 = (-0.1:0.005:0);
Y1 = gridcolor_gen_rev(VVERA5_nonmcs_dry2_bin3,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.1 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.1:0.025:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('Non-MCS (PR<2mm/hr,30^ox30^o)');
title(tn,'FontSize',13);

subplot(3,5,15);
cb1 = (-0.1:0.005:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin3-VVERA5_nonmcs_pr2_bin3,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.1 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.1:0.025:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('Diff Non-MCS (PR>2mm/hr,30^ox30^o)');
title(tn,'FontSize',13);

subplot(3,5,14);
cb1 = (-0.3:0.01:0);
Y1 = gridcolor_gen_rev(VVERA5_mcs_bin3-VVERA5_nonmcs_dry2_bin3,cb1,'YlGnBu9');

colorscheme1 = flipud(othercolor('YlGnBu9',length(Y1)));
colormap(gca,colorscheme1);hold on;
caxis([-0.3 0])
cbh1 = colorbar;
set(cbh1,'YTick',-0.3:0.1:0);
axis([0 length(xt)-1 0 length(yt)-1]) 
set(gca,'FontSize',11)
% cbh.Ticks = linspace(0,330,10);
% cbh.TickLabels = num2cell(0:330); 
% set(cbh,'Position',[.86 .15 .01 .35]);
xlim([0,length(xt)-1]);
xticks(xt);
xticklabels({'0','3','6','9','12','15','18','21','24','27','30'});
ylim([0,length(yt)-1]);
yticks(yt);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
ylabel('Precip Frac of MCS (%)','FontSize',13);
xlabel('Precip (mm/hr)','FontSize',13);
tn = strcat('Diff Non-MCS (PR<2mm/hr,30^ox30^o)');
title(tn,'FontSize',13);