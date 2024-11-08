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
VVERA5_mcs_dry2_all = [];
VVERA5_mcs_pr2_all = [];
VVERA5_nonmcs_dry0_all = [];
VVERA5_nonmcs_pr0_all = [];
VVERA5_mcs_dry0_all = [];
VVERA5_mcs_pr0_all = [];


for i = 1:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry0_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr0_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry0_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr0_10x10_new_' num2str(i) '.mat']);
    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    VVERA5_mcs_all = cat(1,VVERA5_mcs_all,vv_mcs);
    VVERA5_nonmcs_all = cat(1,VVERA5_nonmcs_all,vv_nonmcs);
    VVERA5_nonmcs_dry2_all = cat(1,VVERA5_nonmcs_dry2_all,vv_nonmcs_dry2);
    VVERA5_nonmcs_pr2_all = cat(1,VVERA5_nonmcs_pr2_all,vv_nonmcs_pr2);
    VVERA5_mcs_dry2_all = cat(1,VVERA5_mcs_dry2_all,vv_mcs_dry2);
    VVERA5_mcs_pr2_all = cat(1,VVERA5_mcs_pr2_all,vv_mcs_pr2);
    VVERA5_nonmcs_dry0_all = cat(1,VVERA5_nonmcs_dry0_all,vv_nonmcs_dry0);
    VVERA5_nonmcs_pr0_all = cat(1,VVERA5_nonmcs_pr0_all,vv_nonmcs_pr0);
    VVERA5_mcs_dry0_all = cat(1,VVERA5_mcs_dry0_all,vv_mcs_dry0);
    VVERA5_mcs_pr0_all = cat(1,VVERA5_mcs_pr0_all,vv_mcs_pr0);
end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[VVERA5_mcs_bin1, VVERA5_mcs_bin1_ct, VVERA5_mcs_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_mcs_all);
[VVERA5_nonmcs_bin1, VVERA5_nonmcs_bin1_ct, VVERA5_nonmcs_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_nonmcs_all);
[VVERA5_nonmcs_dry2_bin1, VVERA5_nonmcs_dry2_bin1_ct, VVERA5_nonmcs_dry2_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_nonmcs_dry2_all);
[VVERA5_nonmcs_pr2_bin1, VVERA5_nonmcs_pr2_bin1_ct, VVERA5_nonmcs_pr2_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_nonmcs_pr2_all);
[VVERA5_mcs_dry2_bin1, VVERA5_mcs_dry2_bin1_ct, VVERA5_mcs_dry2_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_mcs_dry2_all);
[VVERA5_mcs_pr2_bin1, VVERA5_mcs_pr2_bin1_ct, VVERA5_mcs_pr2_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_mcs_pr2_all);
[VVERA5_nonmcs_dry0_bin1, VVERA5_nonmcs_dry0_bin1_ct, VVERA5_nonmcs_dry0_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_nonmcs_dry0_all);
[VVERA5_nonmcs_pr0_bin1, VVERA5_nonmcs_pr0_bin1_ct, VVERA5_nonmcs_pr0_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_nonmcs_pr0_all);
[VVERA5_mcs_dry0_bin1, VVERA5_mcs_dry0_bin1_ct, VVERA5_mcs_dry0_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_mcs_dry0_all);
[VVERA5_mcs_pr0_bin1, VVERA5_mcs_pr0_bin1_ct, VVERA5_mcs_pr0_bin1_ctfr] = cal_prvar(pr_all_bin, pr_mcs_all, VVERA5_mcs_pr0_all);


VVERA5_mcs_bin1(VVERA5_mcs_bin1_ct<30)=NaN;
VVERA5_nonmcs_bin1(VVERA5_nonmcs_bin1_ct<30)=NaN;
VVERA5_nonmcs_dry2_bin1(VVERA5_nonmcs_dry2_bin1_ct<30)=NaN;
VVERA5_nonmcs_pr2_bin1(VVERA5_nonmcs_pr2_bin1_ct<30)=NaN;
VVERA5_mcs_dry2_bin1(VVERA5_mcs_dry2_bin1_ct<30)=NaN;
VVERA5_mcs_pr2_bin1(VVERA5_mcs_pr2_bin1_ct<30)=NaN;
VVERA5_nonmcs_dry0_bin1(VVERA5_nonmcs_dry0_bin1_ct<30)=NaN;
VVERA5_nonmcs_pr0_bin1(VVERA5_nonmcs_pr0_bin1_ct<30)=NaN;
VVERA5_mcs_dry0_bin1(VVERA5_mcs_dry0_bin1_ct<30)=NaN;
VVERA5_mcs_pr0_bin1(VVERA5_mcs_pr0_bin1_ct<30)=NaN;

% VVERA5_mcs_wt = sum(VVERA5_mcs_bin1.*VVERA5_mcs_bin1_ct,2,'omitnan')./sum(VVERA5_mcs_bin1_ct,2,'omitnan');
% VVERA5_nonmcs_dry2_wt = sum(VVERA5_nonmcs_dry2_bin1.*VVERA5_nonmcs_dry2_bin1_ct,2,'omitnan')./sum(VVERA5_nonmcs_dry2_bin1_ct,2,'omitnan');
% VVERA5_nonmcs_pr2_wt = sum(VVERA5_nonmcs_pr2_bin1.*VVERA5_nonmcs_pr2_bin1_ct,2,'omitnan')./sum(VVERA5_nonmcs_pr2_bin1_ct,2,'omitnan');
% VVERA5_nonmcs_wt = sum(VVERA5_nonmcs_bin1.*VVERA5_nonmcs_bin1_ct,2,'omitnan')./sum(VVERA5_nonmcs_bin1_ct,2,'omitnan');
% VVERA5_mcs_dry2_wt = sum(VVERA5_mcs_dry2_bin1.*VVERA5_mcs_dry2_bin1_ct,2,'omitnan')./sum(VVERA5_mcs_dry2_bin1_ct,2,'omitnan');
% VVERA5_mcs_pr2_wt = sum(VVERA5_mcs_pr2_bin1.*VVERA5_mcs_pr2_bin1_ct,2,'omitnan')./sum(VVERA5_mcs_pr2_bin1_ct,2,'omitnan');


%%-------------------------------------
%%-------------------------------------
VVERA5_mcs_bin1 = cat(1,mean(VVERA5_mcs_all,'omitnan'),VVERA5_mcs_bin1);
VVERA5_nonmcs_bin1 = cat(1,mean(VVERA5_nonmcs_all,'omitnan'),VVERA5_nonmcs_bin1);
VVERA5_mcs_pr2_bin1 = cat(1,mean(VVERA5_mcs_pr2_all,'omitnan'),VVERA5_mcs_pr2_bin1);
VVERA5_nonmcs_pr2_bin1 = cat(1,mean(VVERA5_nonmcs_pr2_all,'omitnan'),VVERA5_nonmcs_pr2_bin1);
VVERA5_mcs_dry2_bin1 = cat(1,mean(VVERA5_mcs_dry2_all,'omitnan'),VVERA5_mcs_dry2_bin1);
VVERA5_nonmcs_dry2_bin1 = cat(1,mean(VVERA5_nonmcs_dry2_all,'omitnan'),VVERA5_nonmcs_dry2_bin1);
VVERA5_mcs_pr0_bin1 = cat(1,mean(VVERA5_mcs_pr0_all,'omitnan'),VVERA5_mcs_pr0_bin1);
VVERA5_nonmcs_pr0_bin1 = cat(1,mean(VVERA5_nonmcs_pr0_all,'omitnan'),VVERA5_nonmcs_pr0_bin1);
VVERA5_mcs_dry0_bin1 = cat(1,mean(VVERA5_mcs_dry0_all,'omitnan'),VVERA5_mcs_dry0_bin1);
VVERA5_nonmcs_dry0_bin1 = cat(1,mean(VVERA5_nonmcs_dry0_all,'omitnan'),VVERA5_nonmcs_dry0_bin1);

figure(2)
clf;
C=[VVERA5_mcs_bin1 VVERA5_mcs_pr2_bin1 VVERA5_mcs_dry2_bin1 VVERA5_nonmcs_bin1 VVERA5_nonmcs_pr2_bin1 VVERA5_nonmcs_dry2_bin1];
bar(C(1:11,:))
xticks(1:11);
xticklabels({'Total Average','0-10%','10%-20%','20%-30%','30%-40%','40%-50%','50%-60%','60%-70%','70%-80%','80%-90%','90%-100%'});
ylabel('\omega_5_0_0 (Pa/s)','FontSize',13);
xlabel('Domain-averaged Precipitation Percentile','FontSize',13);
legend({'MCS','MCS (PR > 2mm/hr)','MCS (PR < 2mm/hr)','Non-MCS','Non-MCS (PR > 2mm/hr)','Non-MCS (PR < 2mm/hr)'},'location','south','FontSize',13,'NumColumns',2)
title('omega_5_0_0 Within MCS Versus Non-MCS','FontSize',15);

%%-----------------convective aggregation-----------------

[VVERA5_mcs_bin1, VVERA5_mcs_bin1_ct, VVERA5_mcs_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_mcs_all);
[VVERA5_nonmcs_bin1, VVERA5_nonmcs_bin1_ct, VVERA5_nonmcs_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_nonmcs_all);
[VVERA5_nonmcs_dry2_bin1, VVERA5_nonmcs_dry2_bin1_ct, VVERA5_nonmcs_dry2_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_nonmcs_dry2_all);
[VVERA5_nonmcs_pr2_bin1, VVERA5_nonmcs_pr2_bin1_ct, VVERA5_nonmcs_pr2_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_nonmcs_pr2_all);
[VVERA5_mcs_dry2_bin1, VVERA5_mcs_dry2_bin1_ct, VVERA5_mcs_dry2_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_mcs_dry2_all);
[VVERA5_mcs_pr2_bin1, VVERA5_mcs_pr2_bin1_ct, VVERA5_mcs_pr2_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_mcs_pr2_all);
[VVERA5_nonmcs_dry0_bin1, VVERA5_nonmcs_dry0_bin1_ct, VVERA5_nonmcs_dry0_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_nonmcs_dry0_all);
[VVERA5_nonmcs_pr0_bin1, VVERA5_nonmcs_pr0_bin1_ct, VVERA5_nonmcs_pr0_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_nonmcs_pr0_all);
[VVERA5_mcs_dry0_bin1, VVERA5_mcs_dry0_bin1_ct, VVERA5_mcs_dry0_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_mcs_dry0_all);
[VVERA5_mcs_pr0_bin1, VVERA5_mcs_pr0_bin1_ct, VVERA5_mcs_pr0_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, VVERA5_mcs_pr0_all);


VVERA5_mcs_bin1(VVERA5_mcs_bin1_ct<30)=NaN;
VVERA5_nonmcs_bin1(VVERA5_nonmcs_bin1_ct<30)=NaN;
VVERA5_nonmcs_dry2_bin1(VVERA5_nonmcs_dry2_bin1_ct<30)=NaN;
VVERA5_nonmcs_pr2_bin1(VVERA5_nonmcs_pr2_bin1_ct<30)=NaN;
VVERA5_mcs_dry2_bin1(VVERA5_mcs_dry2_bin1_ct<30)=NaN;
VVERA5_mcs_pr2_bin1(VVERA5_mcs_pr2_bin1_ct<30)=NaN;
VVERA5_nonmcs_dry0_bin1(VVERA5_nonmcs_dry0_bin1_ct<30)=NaN;
VVERA5_nonmcs_pr0_bin1(VVERA5_nonmcs_pr0_bin1_ct<30)=NaN;
VVERA5_mcs_dry0_bin1(VVERA5_mcs_dry0_bin1_ct<30)=NaN;
VVERA5_mcs_pr0_bin1(VVERA5_mcs_pr0_bin1_ct<30)=NaN;

% VVERA5_mcs_wt = sum(VVERA5_mcs_bin1.*VVERA5_mcs_bin1_ct,2,'omitnan')./sum(VVERA5_mcs_bin1_ct,2,'omitnan');
% VVERA5_nonmcs_dry2_wt = sum(VVERA5_nonmcs_dry2_bin1.*VVERA5_nonmcs_dry2_bin1_ct,2,'omitnan')./sum(VVERA5_nonmcs_dry2_bin1_ct,2,'omitnan');
% VVERA5_nonmcs_pr2_wt = sum(VVERA5_nonmcs_pr2_bin1.*VVERA5_nonmcs_pr2_bin1_ct,2,'omitnan')./sum(VVERA5_nonmcs_pr2_bin1_ct,2,'omitnan');
% VVERA5_nonmcs_wt = sum(VVERA5_nonmcs_bin1.*VVERA5_nonmcs_bin1_ct,2,'omitnan')./sum(VVERA5_nonmcs_bin1_ct,2,'omitnan');
% VVERA5_mcs_dry2_wt = sum(VVERA5_mcs_dry2_bin1.*VVERA5_mcs_dry2_bin1_ct,2,'omitnan')./sum(VVERA5_mcs_dry2_bin1_ct,2,'omitnan');
% VVERA5_mcs_pr2_wt = sum(VVERA5_mcs_pr2_bin1.*VVERA5_mcs_pr2_bin1_ct,2,'omitnan')./sum(VVERA5_mcs_pr2_bin1_ct,2,'omitnan');


%%-------------------------------------
%%-------------------------------------
VVERA5_mcs_bin1 = cat(1,mean(VVERA5_mcs_all,'omitnan'),VVERA5_mcs_bin1);
VVERA5_nonmcs_bin1 = cat(1,mean(VVERA5_nonmcs_all,'omitnan'),VVERA5_nonmcs_bin1);
VVERA5_mcs_pr2_bin1 = cat(1,mean(VVERA5_mcs_pr2_all,'omitnan'),VVERA5_mcs_pr2_bin1);
VVERA5_nonmcs_pr2_bin1 = cat(1,mean(VVERA5_nonmcs_pr2_all,'omitnan'),VVERA5_nonmcs_pr2_bin1);
VVERA5_mcs_dry2_bin1 = cat(1,mean(VVERA5_mcs_dry2_all,'omitnan'),VVERA5_mcs_dry2_bin1);
VVERA5_nonmcs_dry2_bin1 = cat(1,mean(VVERA5_nonmcs_dry2_all,'omitnan'),VVERA5_nonmcs_dry2_bin1);
VVERA5_mcs_pr0_bin1 = cat(1,mean(VVERA5_mcs_pr0_all,'omitnan'),VVERA5_mcs_pr0_bin1);
VVERA5_nonmcs_pr0_bin1 = cat(1,mean(VVERA5_nonmcs_pr0_all,'omitnan'),VVERA5_nonmcs_pr0_bin1);
VVERA5_mcs_dry0_bin1 = cat(1,mean(VVERA5_mcs_dry0_all,'omitnan'),VVERA5_mcs_dry0_bin1);
VVERA5_nonmcs_dry0_bin1 = cat(1,mean(VVERA5_nonmcs_dry0_all,'omitnan'),VVERA5_nonmcs_dry0_bin1);

figure(2)
clf;
C=[VVERA5_mcs_bin1 VVERA5_mcs_pr2_bin1 VVERA5_mcs_dry2_bin1 VVERA5_nonmcs_bin1 VVERA5_nonmcs_pr2_bin1 VVERA5_nonmcs_dry2_bin1];
x = [0.2 1:0.5:5.5];
bar(x,C(1:11,:));
xlim([-0.2 5.9]);
xticks([0.2 1:0.5:5.5]);
set(gca,'FontSize',15)
xticklabels({'Total Average','0-10%','10%-20%','20%-30%','30%-40%','40%-50%','50%-60%','60%-70%','70%-80%','80%-90%','90%-100%'});
xline(0.6,'k:','linewidth',1.8);
ylabel('\omega_5_0_0 (Pa/s)','FontSize',16);
xlabel('Domain Forg Percentile','FontSize',16);
legend({'MCS','MCS (PR > 2mm/hr)','MCS (PR < 2mm/hr)','Non-MCS','Non-MCS (PR > 2mm/hr)','Non-MCS (PR < 2mm/hr)'},'location','south','FontSize',15,'NumColumns',2)
title('\omega_5_0_0 Of MCS And Non-MCS','FontSize',18);


