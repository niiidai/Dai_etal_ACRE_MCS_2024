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
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];
vv_nonmcs_dry0_all = [];
vv_nonmcs_pr0_all = [];
vv_mcs_dry0_all = [];
vv_mcs_pr0_all = [];

for i = 2:3
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
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);
    vv_nonmcs_dry0_all = cat(1,vv_nonmcs_dry0_all,vv_nonmcs_dry0);
    vv_nonmcs_pr0_all = cat(1,vv_nonmcs_pr0_all,vv_nonmcs_pr0);
    vv_mcs_dry0_all = cat(1,vv_mcs_dry0_all,vv_mcs_dry0);
    vv_mcs_pr0_all = cat(1,vv_mcs_pr0_all,vv_mcs_pr0);
end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin1, vv_mcs_bin1_ct, vv_mcs_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin1, vv_nonmcs_bin1_ct, vv_nonmcs_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin1, vv_nonmcs_dry2_bin1_ct, vv_nonmcs_dry2_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin1, vv_nonmcs_pr2_bin1_ct, vv_nonmcs_pr2_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin1, vv_mcs_dry2_bin1_ct, vv_mcs_dry2_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin1, vv_mcs_pr2_bin1_ct, vv_mcs_pr2_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);
[vv_nonmcs_dry0_bin1, vv_nonmcs_dry0_bin1_ct, vv_nonmcs_dry0_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry0_all);
[vv_nonmcs_pr0_bin1, vv_nonmcs_pr0_bin1_ct, vv_nonmcs_pr0_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr0_all);
[vv_mcs_dry0_bin1, vv_mcs_dry0_bin1_ct, vv_mcs_dry0_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry0_all);
[vv_mcs_pr0_bin1, vv_mcs_pr0_bin1_ct, vv_mcs_pr0_bin1_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr0_all);

vv_mcs_bin1(vv_mcs_bin1_ct<30)=NaN;
vv_nonmcs_bin1(vv_nonmcs_bin1_ct<30)=NaN;
vv_nonmcs_dry2_bin1(vv_nonmcs_dry2_bin1_ct<30)=NaN;
vv_nonmcs_pr2_bin1(vv_nonmcs_pr2_bin1_ct<30)=NaN;
vv_mcs_dry2_bin1(vv_mcs_dry2_bin1_ct<30)=NaN;
vv_mcs_pr2_bin1(vv_mcs_pr2_bin1_ct<30)=NaN;
vv_nonmcs_dry0_bin1(vv_nonmcs_dry0_bin1_ct<30)=NaN;
vv_nonmcs_pr0_bin1(vv_nonmcs_pr0_bin1_ct<30)=NaN;
vv_mcs_dry0_bin1(vv_mcs_dry0_bin1_ct<30)=NaN;
vv_mcs_pr0_bin1(vv_mcs_pr0_bin1_ct<30)=NaN;

%%----------------10x10-3hrb-----------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];


for i = 2:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_3hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_3hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_3hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_3hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_3hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_3hrb_new_' num2str(i) '.mat']);

    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);

end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin2, vv_mcs_bin2_ct, vv_mcs_bin2_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin2, vv_nonmcs_bin2_ct, vv_nonmcs_bin2_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin2, vv_nonmcs_dry2_bin2_ct, vv_nonmcs_dry2_bin2_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin2, vv_nonmcs_pr2_bin2_ct, vv_nonmcs_pr2_bin2_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin2, vv_mcs_dry2_bin2_ct, vv_mcs_dry2_bin2_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin2, vv_mcs_pr2_bin2_ct, vv_mcs_pr2_bin2_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);

vv_mcs_bin2(vv_mcs_bin2_ct<30)=NaN;
vv_nonmcs_bin2(vv_nonmcs_bin2_ct<30)=NaN;
vv_nonmcs_dry2_bin2(vv_nonmcs_dry2_bin2_ct<30)=NaN;
vv_nonmcs_pr2_bin2(vv_nonmcs_pr2_bin2_ct<30)=NaN;
vv_mcs_dry2_bin2(vv_mcs_dry2_bin2_ct<30)=NaN;
vv_mcs_pr2_bin2(vv_mcs_pr2_bin2_ct<30)=NaN;

%%----------------10x10-6hrb-----------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];


for i = 2:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_6hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_6hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_6hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_6hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_6hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_6hrb_new_' num2str(i) '.mat']);

    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);

end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin3, vv_mcs_bin3_ct, vv_mcs_bin3_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin3, vv_nonmcs_bin3_ct, vv_nonmcs_bin3_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin3, vv_nonmcs_dry2_bin3_ct, vv_nonmcs_dry2_bin3_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin3, vv_nonmcs_pr2_bin3_ct, vv_nonmcs_pr2_bin3_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin3, vv_mcs_dry2_bin3_ct, vv_mcs_dry2_bin3_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin3, vv_mcs_pr2_bin3_ct, vv_mcs_pr2_bin3_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);

vv_mcs_bin3(vv_mcs_bin3_ct<30)=NaN;
vv_nonmcs_bin3(vv_nonmcs_bin3_ct<30)=NaN;
vv_nonmcs_dry2_bin3(vv_nonmcs_dry2_bin3_ct<30)=NaN;
vv_nonmcs_pr2_bin3(vv_nonmcs_pr2_bin3_ct<30)=NaN;
vv_mcs_dry2_bin3(vv_mcs_dry2_bin3_ct<30)=NaN;
vv_mcs_pr2_bin3(vv_mcs_pr2_bin3_ct<30)=NaN;

%%----------------10x10-9hrb-----------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];


for i = 2:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_9hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_9hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_9hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_9hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_9hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_9hrb_new_' num2str(i) '.mat']);

    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);

end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin4, vv_mcs_bin4_ct, vv_mcs_bin4_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin4, vv_nonmcs_bin4_ct, vv_nonmcs_bin4_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin4, vv_nonmcs_dry2_bin4_ct, vv_nonmcs_dry2_bin4_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin4, vv_nonmcs_pr2_bin4_ct, vv_nonmcs_pr2_bin4_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin4, vv_mcs_dry2_bin4_ct, vv_mcs_dry2_bin4_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin4, vv_mcs_pr2_bin4_ct, vv_mcs_pr2_bin4_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);

vv_mcs_bin4(vv_mcs_bin4_ct<30)=NaN;
vv_nonmcs_bin4(vv_nonmcs_bin4_ct<30)=NaN;
vv_nonmcs_dry2_bin4(vv_nonmcs_dry2_bin4_ct<30)=NaN;
vv_nonmcs_pr2_bin4(vv_nonmcs_pr2_bin4_ct<30)=NaN;
vv_mcs_dry2_bin4(vv_mcs_dry2_bin4_ct<30)=NaN;
vv_mcs_pr2_bin4(vv_mcs_pr2_bin4_ct<30)=NaN;

%%----------------10x10-12hrb-----------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];


for i = 2:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_12hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_12hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_12hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_12hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_12hrb_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_12hrb_new_' num2str(i) '.mat']);

    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);

end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin5, vv_mcs_bin5_ct, vv_mcs_bin5_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin5, vv_nonmcs_bin5_ct, vv_nonmcs_bin5_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin5, vv_nonmcs_dry2_bin5_ct, vv_nonmcs_dry2_bin5_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin5, vv_nonmcs_pr2_bin5_ct, vv_nonmcs_pr2_bin5_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin5, vv_mcs_dry2_bin5_ct, vv_mcs_dry2_bin5_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin5, vv_mcs_pr2_bin5_ct, vv_mcs_pr2_bin5_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);

vv_mcs_bin5(vv_mcs_bin5_ct<30)=NaN;
vv_nonmcs_bin5(vv_nonmcs_bin5_ct<30)=NaN;
vv_nonmcs_dry2_bin5(vv_nonmcs_dry2_bin5_ct<30)=NaN;
vv_nonmcs_pr2_bin5(vv_nonmcs_pr2_bin5_ct<30)=NaN;
vv_mcs_dry2_bin5(vv_mcs_dry2_bin5_ct<30)=NaN;
vv_mcs_pr2_bin5(vv_mcs_pr2_bin5_ct<30)=NaN;

%%----------------10x10-3hra-----------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];


for i = 2:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_3hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_3hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_3hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_3hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_3hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_3hra_new_' num2str(i) '.mat']);

    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);

end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin6, vv_mcs_bin6_ct, vv_mcs_bin6_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin6, vv_nonmcs_bin6_ct, vv_nonmcs_bin6_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin6, vv_nonmcs_dry2_bin6_ct, vv_nonmcs_dry2_bin6_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin6, vv_nonmcs_pr2_bin6_ct, vv_nonmcs_pr2_bin6_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin6, vv_mcs_dry2_bin6_ct, vv_mcs_dry2_bin6_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin6, vv_mcs_pr2_bin6_ct, vv_mcs_pr2_bin6_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);

vv_mcs_bin6(vv_mcs_bin6_ct<30)=NaN;
vv_nonmcs_bin6(vv_nonmcs_bin6_ct<30)=NaN;
vv_nonmcs_dry2_bin6(vv_nonmcs_dry2_bin6_ct<30)=NaN;
vv_nonmcs_pr2_bin6(vv_nonmcs_pr2_bin6_ct<30)=NaN;
vv_mcs_dry2_bin6(vv_mcs_dry2_bin6_ct<30)=NaN;
vv_mcs_pr2_bin6(vv_mcs_pr2_bin6_ct<30)=NaN;

%%----------------10x10-6hra-----------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];


for i = 2:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_6hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_6hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_6hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_6hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_6hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_6hra_new_' num2str(i) '.mat']);

    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);

end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin7, vv_mcs_bin7_ct, vv_mcs_bin7_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin7, vv_nonmcs_bin7_ct, vv_nonmcs_bin7_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin7, vv_nonmcs_dry2_bin7_ct, vv_nonmcs_dry2_bin7_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin7, vv_nonmcs_pr2_bin7_ct, vv_nonmcs_pr2_bin7_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin7, vv_mcs_dry2_bin7_ct, vv_mcs_dry2_bin7_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin7, vv_mcs_pr2_bin7_ct, vv_mcs_pr2_bin7_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);

vv_mcs_bin7(vv_mcs_bin7_ct<30)=NaN;
vv_nonmcs_bin7(vv_nonmcs_bin7_ct<30)=NaN;
vv_nonmcs_dry2_bin7(vv_nonmcs_dry2_bin7_ct<30)=NaN;
vv_nonmcs_pr2_bin7(vv_nonmcs_pr2_bin7_ct<30)=NaN;
vv_mcs_dry2_bin7(vv_mcs_dry2_bin7_ct<30)=NaN;
vv_mcs_pr2_bin7(vv_mcs_pr2_bin7_ct<30)=NaN;

%%----------------10x10-9hra-----------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];


for i = 2:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_9hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_9hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_9hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_9hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_9hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_9hra_new_' num2str(i) '.mat']);

    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);

end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin8, vv_mcs_bin8_ct, vv_mcs_bin8_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin8, vv_nonmcs_bin8_ct, vv_nonmcs_bin8_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin8, vv_nonmcs_dry2_bin8_ct, vv_nonmcs_dry2_bin8_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin8, vv_nonmcs_pr2_bin8_ct, vv_nonmcs_pr2_bin8_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin8, vv_mcs_dry2_bin8_ct, vv_mcs_dry2_bin8_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin8, vv_mcs_pr2_bin8_ct, vv_mcs_pr2_bin8_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);

vv_mcs_bin8(vv_mcs_bin8_ct<30)=NaN;
vv_nonmcs_bin8(vv_nonmcs_bin8_ct<30)=NaN;
vv_nonmcs_dry2_bin8(vv_nonmcs_dry2_bin8_ct<30)=NaN;
vv_nonmcs_pr2_bin8(vv_nonmcs_pr2_bin8_ct<30)=NaN;
vv_mcs_dry2_bin8(vv_mcs_dry2_bin8_ct<30)=NaN;
vv_mcs_pr2_bin8(vv_mcs_pr2_bin8_ct<30)=NaN;

%%----------------10x10-12hra-----------------------------------------------------------
pr_mcs_all = [];
pr_nonmcs_all = [];
prfrac_mcs_all = [];
vv_mcs_all = [];
vv_nonmcs_all = [];
vv_nonmcs_dry2_all = [];
vv_nonmcs_pr2_all = [];
vv_mcs_dry2_all = [];
vv_mcs_pr2_all = [];


for i = 2:3
    load(['Processed3/pr_10x10_new_' num2str(i) '.mat']);
    load(['Processed3/pr_nonmcs_10x10_new_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_10x10_12hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_10x10_12hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_dry2_10x10_12hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_nonmcs_pr2_10x10_12hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_dry2_10x10_12hra_new_' num2str(i) '.mat']);
    load(['Processed3/vv_mcs_pr2_10x10_12hra_new_' num2str(i) '.mat']);

    pr_mcs_all = cat(1,pr_mcs_all,pr);
    pr_nonmcs_all = cat(1,pr_nonmcs_all,pr_nonmcs);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    vv_mcs_all = cat(1,vv_mcs_all,vv_mcs);
    vv_nonmcs_all = cat(1,vv_nonmcs_all,vv_nonmcs);
    vv_nonmcs_dry2_all = cat(1,vv_nonmcs_dry2_all,vv_nonmcs_dry2);
    vv_nonmcs_pr2_all = cat(1,vv_nonmcs_pr2_all,vv_nonmcs_pr2);
    vv_mcs_dry2_all = cat(1,vv_mcs_dry2_all,vv_mcs_dry2);
    vv_mcs_pr2_all = cat(1,vv_mcs_pr2_all,vv_mcs_pr2);

end

%pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
%pr_mcs_bin = [0,2,4,6,8,10,12,14,16,18,20];

[vv_mcs_bin9, vv_mcs_bin9_ct, vv_mcs_bin9_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_all);
[vv_nonmcs_bin9, vv_nonmcs_bin9_ct, vv_nonmcs_bin9_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_all);
[vv_nonmcs_dry2_bin9, vv_nonmcs_dry2_bin9_ct, vv_nonmcs_dry2_bin9_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_dry2_all);
[vv_nonmcs_pr2_bin9, vv_nonmcs_pr2_bin9_ct, vv_nonmcs_pr2_bin9_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_nonmcs_pr2_all);
[vv_mcs_dry2_bin9, vv_mcs_dry2_bin9_ct, vv_mcs_dry2_bin9_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_dry2_all);
[vv_mcs_pr2_bin9, vv_mcs_pr2_bin9_ct, vv_mcs_pr2_bin9_ctfr] = cal_prvar(prfrac_bin, prfrac_mcs_all, vv_mcs_pr2_all);

vv_mcs_bin9(vv_mcs_bin9_ct<30)=NaN;
vv_nonmcs_bin9(vv_nonmcs_bin9_ct<30)=NaN;
vv_nonmcs_dry2_bin9(vv_nonmcs_dry2_bin9_ct<30)=NaN;
vv_nonmcs_pr2_bin9(vv_nonmcs_pr2_bin9_ct<30)=NaN;
vv_mcs_dry2_bin9(vv_mcs_dry2_bin9_ct<30)=NaN;
vv_mcs_pr2_bin9(vv_mcs_pr2_bin9_ct<30)=NaN;

C1=[vv_mcs_bin1 vv_mcs_pr2_bin1 vv_mcs_dry2_bin1 vv_nonmcs_bin1 vv_nonmcs_pr2_bin1 vv_nonmcs_dry2_bin1];
C2=[vv_mcs_bin2 vv_mcs_pr2_bin2 vv_mcs_dry2_bin2 vv_nonmcs_bin2 vv_nonmcs_pr2_bin2 vv_nonmcs_dry2_bin2];
C3=[vv_mcs_bin3 vv_mcs_pr2_bin3 vv_mcs_dry2_bin3 vv_nonmcs_bin3 vv_nonmcs_pr2_bin3 vv_nonmcs_dry2_bin3];
C4=[vv_mcs_bin4 vv_mcs_pr2_bin4 vv_mcs_dry2_bin4 vv_nonmcs_bin4 vv_nonmcs_pr2_bin4 vv_nonmcs_dry2_bin4];
C5=[vv_mcs_bin5 vv_mcs_pr2_bin5 vv_mcs_dry2_bin5 vv_nonmcs_bin5 vv_nonmcs_pr2_bin5 vv_nonmcs_dry2_bin5];
C6=[vv_mcs_bin6 vv_mcs_pr2_bin6 vv_mcs_dry2_bin6 vv_nonmcs_bin6 vv_nonmcs_pr2_bin6 vv_nonmcs_dry2_bin6];
C7=[vv_mcs_bin7 vv_mcs_pr2_bin7 vv_mcs_dry2_bin7 vv_nonmcs_bin7 vv_nonmcs_pr2_bin7 vv_nonmcs_dry2_bin7];
C8=[vv_mcs_bin8 vv_mcs_pr2_bin8 vv_mcs_dry2_bin8 vv_nonmcs_bin8 vv_nonmcs_pr2_bin8 vv_nonmcs_dry2_bin8];
C9=[vv_mcs_bin9 vv_mcs_pr2_bin9 vv_mcs_dry2_bin9 vv_nonmcs_bin9 vv_nonmcs_pr2_bin9 vv_nonmcs_dry2_bin9];

C = zeros(10,6,9);
C(:,:,1) = C5;
C(:,:,2) = C4;
C(:,:,3) = C3;
C(:,:,4) = C2;
C(:,:,5) = C1;
C(:,:,6) = C6;
C(:,:,7) = C7;
C(:,:,8) = C8;
C(:,:,9) = C9;

figure(3)
clf;
subplot(2,3,1);
hs = bar3(squeeze(C(:,1,:)));
set(hs,'FaceAlpha',0.8);
xticks(1:9);
xticklabels({'12hrb','9hrb','6hrb','3hrb','0hr','3hra','6hra','9hra','12hra'});
yticks(1:10);
yticklabels({'0-10','10-20','20-30','30-40','40-50','50-60','60-70','70-80','80-90','90-100'});
xlabel('Hours','FontSize',13)
zlim([-0.3 0.02]);
zticks([-0.3:0.05:0.02]);
zlabel('\omega_5_0_0 (Pa/s)','FontSize',13);
ylabel('Domain Forg Percentile','FontSize',13);
%legend({'MCS','MCS (PR > 2mm/hr)','MCS (PR < 2mm/hr)','Non-MCS','Non-MCS (PR > 2mm/hr)','Non-MCS (PR < 2mm/hr)'},'location','northwest','FontSize',13,'NumColumns',2)
title('(a) \omega_5_0_0 of MCS','FontSize',15);

subplot(2,3,2);
hs = bar3(squeeze(C(:,2,:)));
set(hs,'FaceAlpha',0.8);
xticks(1:9);
xticklabels({'12hrb','9hrb','6hrb','3hrb','0hr','3hra','6hra','9hra','12hra'});
yticks(1:10);
yticklabels({'0-10','10-20','20-30','30-40','40-50','50-60','60-70','70-80','80-90','90-100'});
xlabel('Hours','FontSize',13)
zlim([-0.3 0.02]);
zticks([-0.3:0.05:0.02]);
zlabel('\omega_5_0_0 (Pa/s)','FontSize',13);
ylabel('Domain Forg Percentile','FontSize',13);
%legend({'MCS','MCS (PR > 2mm/hr)','MCS (PR < 2mm/hr)','Non-MCS','Non-MCS (PR > 2mm/hr)','Non-MCS (PR < 2mm/hr)'},'location','northwest','FontSize',13,'NumColumns',2)
title('(b) \omega_5_0_0 of MCS (PR > 2 mm/hr)','FontSize',15);

subplot(2,3,3);
hs = bar3(squeeze(C(:,3,:)));
set(hs,'FaceAlpha',0.8);
xticks(1:9);
xticklabels({'12hrb','9hrb','6hrb','3hrb','0hr','3hra','6hra','9hra','12hra'});
yticks(1:10);
yticklabels({'0-10','10-20','20-30','30-40','40-50','50-60','60-70','70-80','80-90','90-100'});
xlabel('Hours','FontSize',13)
zlim([-0.3 0.02]);
zticks([-0.3:0.05:0.02]);
zlabel('\omega_5_0_0 (Pa/s)','FontSize',13);
ylabel('Domain Forg Percentile','FontSize',13);
%legend({'MCS','MCS (PR > 2mm/hr)','MCS (PR < 2mm/hr)','Non-MCS','Non-MCS (PR > 2mm/hr)','Non-MCS (PR < 2mm/hr)'},'location','northwest','FontSize',13,'NumColumns',2)
title('(c) \omega_5_0_0 of MCS (PR < 2 mm/hr)','FontSize',15);

subplot(2,3,4);
hs = bar3(squeeze(C(:,4,:)));
set(hs,'FaceAlpha',0.8);
xticks(1:9);
xticklabels({'12hrb','9hrb','6hrb','3hrb','0hr','3hra','6hra','9hra','12hra'});
yticks(1:10);
yticklabels({'0-10','10-20','20-30','30-40','40-50','50-60','60-70','70-80','80-90','90-100'});
xlabel('Hours','FontSize',13)
zlim([-0.3 0.02]);
zticks([-0.3:0.05:0.02]);
zlabel('\omega_5_0_0 (Pa/s)','FontSize',13);
ylabel('Domain Forg Percentile','FontSize',13);
%legend({'MCS','MCS (PR > 2mm/hr)','MCS (PR < 2mm/hr)','Non-MCS','Non-MCS (PR > 2mm/hr)','Non-MCS (PR < 2mm/hr)'},'location','northwest','FontSize',13,'NumColumns',2)
title('(d) \omega_5_0_0 of Non-MCS','FontSize',15);

subplot(2,3,5);
hs = bar3(squeeze(C(:,5,:)));
set(hs,'FaceAlpha',0.8);
xticks(1:9);
xticklabels({'12hrb','9hrb','6hrb','3hrb','0hr','3hra','6hra','9hra','12hra'});
yticks(1:10);
yticklabels({'0-10','10-20','20-30','30-40','40-50','50-60','60-70','70-80','80-90','90-100'});
xlabel('Hours','FontSize',13)
zlim([-0.3 0.02]);
zticks([-0.3:0.05:0.02]);
zlabel('\omega_5_0_0 (Pa/s)','FontSize',13);
ylabel('Domain Forg Percentile','FontSize',13);
%legend({'MCS','MCS (PR > 2mm/hr)','MCS (PR < 2mm/hr)','Non-MCS','Non-MCS (PR > 2mm/hr)','Non-MCS (PR < 2mm/hr)'},'location','northwest','FontSize',13,'NumColumns',2)
title('(e) \omega_5_0_0 of Non-MCS (PR > 2mm/hr)','FontSize',15);

subplot(2,3,6);
hs = bar3(squeeze(C(:,6,:)));
set(hs,'FaceAlpha',0.8);
xticks(1:9);
xticklabels({'12hrb','9hrb','6hrb','3hrb','0hr','3hra','6hra','9hra','12hra'});
yticks(1:10);
yticklabels({'0-10','10-20','20-30','30-40','40-50','50-60','60-70','70-80','80-90','90-100'});
xlabel('Hours','FontSize',13)
zlim([-0.3 0.02]);
zticks([-0.3:0.05:0.02]);
zlabel('\omega_5_0_0 (Pa/s)','FontSize',13);
ylabel('Domain Forg Percentile','FontSize',13);
%legend({'MCS','MCS (PR > 2mm/hr)','MCS (PR < 2mm/hr)','Non-MCS','Non-MCS (PR > 2mm/hr)','Non-MCS (PR < 2mm/hr)'},'location','northwest','FontSize',13,'NumColumns',2)
title('(f) \omega_5_0_0 of Non-MCS (PR < 2mm/hr)','FontSize',15);