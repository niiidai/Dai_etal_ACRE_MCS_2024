%with zero rain pixels
%clear all;
addpath('../Shared');
addpath('../Project4');

%%----------------10x10------------------------------------------------------------
pr_mcs_all = [];
COP_all = [];
Iorg_all = [];
prfrac_mcs_all = [];
aos_all = [];
cwv_all = [];
cwv_mean_all = [];
N_all = [];
Area_all = [];
prfrac_actual_mcs_all = [];

for i = 1:3
    load(['Processed/recentered/pr_mcs_10x10_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/COP_10x10_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Iorg_10x10_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_every5_' num2str(i) '.mat']);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    load(['Processed/recentered/aos_10x10_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_10x10_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_mean_10x10_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/N_10x10_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Area_10x10_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_10x10_actual_every5_' num2str(i) '.mat']);
    prfrac_actual_mcs_all = cat(1,prfrac_actual_mcs_all,prfrac_mcs);
    pr_mcs_all = cat(1,pr_mcs_all,pr_mcs);
    COP_all = cat(1,COP_all,COP);
    Iorg_all = cat(1,Iorg_all,Iorg);
    N_all = cat(1,N_all,N);
    Area_all = cat(1,Area_all,Area);
    aos_all = cat(1,aos_all,aos);
    cwv_all = cat(1,cwv_all,cwv);
    cwv_mean_all = cat(1,cwv_mean_all,cwv_mean);
    
end

cwv_all = cwv_all;
pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
prfrac_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
prfrac_actual_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
Iorg_bin = 0:0.05:0.70;
COP_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
aos_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
cwv_bin = 0:2:24;

% [N1_aos_bin, N1_aos_bin_ct, N1_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, N_all);
% [N1_cwv_bin, N1_cwv_bin_ct, N1_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, N_all);
% [N1_COP_bin, N1_COP_bin_ct, N1_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, N_all);
% [N1_Iorg_bin, N1_Iorg_bin_ct, N1_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, N_all);
% [N1_prfrac_bin, N1_prfrac_bin_ct, N1_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, N_all);
% [N1_prfrac_actual_bin, N1_prfrac_actual_bin_ct, N1_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, N_all);

[Area1_aos_bin, Area1_aos_bin_ct, Area1_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, Area_all);
[Area1_cwv_bin, Area1_cwv_bin_ct, Area1_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, Area_all);
[Area1_COP_bin, Area1_COP_bin_ct, Area1_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, Area_all);
[Area1_Iorg_bin, Area1_Iorg_bin_ct, Area1_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, Area_all);
[Area1_prfrac_bin, Area1_prfrac_bin_ct, Area1_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, Area_all);
[Area1_prfrac_actual_bin, Area1_prfrac_actual_bin_ct, Area1_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, Area_all);


[Pr1_aos_bin, Pr1_aos_bin_ct, Pr1_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, pr_mcs_all);
[Pr1_cwv_bin, Pr1_cwv_bin_ct, Pr1_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, pr_mcs_all);
[Pr1_COP_bin, Pr1_COP_bin_ct, Pr1_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, pr_mcs_all);
[Pr1_Iorg_bin, Pr1_Iorg_bin_ct, Pr1_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, pr_mcs_all);
[Pr1_prfrac_bin, Pr1_prfrac_bin_ct, Pr1_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, pr_mcs_all);
[Pr1_prfrac_actual_bin, Pr1_prfrac_actual_bin_ct, Pr1_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, pr_mcs_all);

%%----------------20x20------------------------------------------------------------
pr_mcs_all = [];
COP_all = [];
Iorg_all = [];
prfrac_mcs_all = [];
aos_all = [];
cwv_all = [];
cwv_mean_all = [];
N_all = [];
Area_all = [];
prfrac_actual_mcs_all = [];


for i = 1:3
    load(['Processed/recentered/pr_mcs_20x20_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/COP_20x20_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Iorg_20x20_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_20x20_every5_' num2str(i) '.mat']);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    load(['Processed/recentered/aos_20x20_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_20x20_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_mean_20x20_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/N_20x20_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Area_20x20_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_20x20_actual_every5_' num2str(i) '.mat']);
    prfrac_actual_mcs_all = cat(1,prfrac_actual_mcs_all,prfrac_mcs);
    pr_mcs_all = cat(1,pr_mcs_all,pr_mcs);
    COP_all = cat(1,COP_all,COP);
    Iorg_all = cat(1,Iorg_all,Iorg);
    N_all = cat(1,N_all,N);
    Area_all = cat(1,Area_all,Area);
    aos_all = cat(1,aos_all,aos);
    cwv_all = cat(1,cwv_all,cwv);
    cwv_mean_all = cat(1,cwv_mean_all,cwv_mean);
end

cwv_all = cwv_all;
pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
prfrac_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
prfrac_actual_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
Iorg_bin = 0:0.05:0.70;
COP_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
aos_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
cwv_bin = 0:2:24;
% 
% [N2_aos_bin, N2_aos_bin_ct, N2_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, N_all);
% [N2_cwv_bin, N2_cwv_bin_ct, N2_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, N_all);
% [N2_COP_bin, N2_COP_bin_ct, N2_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, N_all);
% [N2_Iorg_bin, N2_Iorg_bin_ct, N2_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, N_all);
% [N2_prfrac_bin, N2_prfrac_bin_ct, N2_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, N_all);
% [N2_prfrac_actual_bin, N2_prfrac_actual_bin_ct, N2_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, N_all);

[Area2_aos_bin, Area2_aos_bin_ct, Area2_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, Area_all);
[Area2_cwv_bin, Area2_cwv_bin_ct, Area2_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, Area_all);
[Area2_COP_bin, Area2_COP_bin_ct, Area2_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, Area_all);
[Area2_Iorg_bin, Area2_Iorg_bin_ct, Area2_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, Area_all);
[Area2_prfrac_bin, Area2_prfrac_bin_ct, Area2_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, Area_all);
[Area2_prfrac_actual_bin, Area2_prfrac_actual_bin_ct, Area2_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, Area_all);

[Pr2_aos_bin, Pr2_aos_bin_ct, Pr2_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, pr_mcs_all);
[Pr2_cwv_bin, Pr2_cwv_bin_ct, Pr2_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, pr_mcs_all);
[Pr2_COP_bin, Pr2_COP_bin_ct, Pr2_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, pr_mcs_all);
[Pr2_Iorg_bin, Pr2_Iorg_bin_ct, Pr2_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, pr_mcs_all);
[Pr2_prfrac_bin, Pr2_prfrac_bin_ct, Pr2_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, pr_mcs_all);
[Pr2_prfrac_actual_bin, Pr2_prfrac_actual_bin_ct, Pr2_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, pr_mcs_all);

%%----------------30x30------------------------------------------------------------
pr_mcs_all = [];
COP_all = [];
Iorg_all = [];
prfrac_mcs_all = [];
aos_all = [];
cwv_all = [];
cwv_mean_all = [];
N_all = [];
Area_all = [];
prfrac_actual_mcs_all = [];


for i = 1:3
    load(['Processed/recentered/pr_mcs_30x30_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/COP_30x30_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Iorg_30x30_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_30x30_every5_' num2str(i) '.mat']);
    prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    load(['Processed/recentered/aos_30x30_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_30x30_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_mean_30x30_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/N_30x30_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Area_30x30_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/prfrac_mcs_30x30_actual_every5_' num2str(i) '.mat']);
    prfrac_actual_mcs_all = cat(1,prfrac_actual_mcs_all,prfrac_mcs);
    pr_mcs_all = cat(1,pr_mcs_all,pr_mcs);
    COP_all = cat(1,COP_all,COP);
    Iorg_all = cat(1,Iorg_all,Iorg);
    N_all = cat(1,N_all,N);
    Area_all = cat(1,Area_all,Area);
    aos_all = cat(1,aos_all,aos);
    cwv_all = cat(1,cwv_all,cwv);
    cwv_mean_all = cat(1,cwv_mean_all,cwv_mean);
end

cwv_all = cwv_all;
pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
prfrac_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
prfrac_actual_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
Iorg_bin = 0:0.05:0.70;
COP_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
aos_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
cwv_bin = 0:2:24;

% [N3_aos_bin, N3_aos_bin_ct, N3_aos_bin_ctfr] = cal_prvar(aos_bin,
% aos_all, N_all); [N3_cwv_bin, N3_cwv_bin_ct, N3_cwv_bin_ctfr] =
% cal_prvar(cwv_bin, cwv_all, N_all); [N3_COP_bin, N3_COP_bin_ct,
% N3_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, N_all); [N3_Iorg_bin,
% N3_Iorg_bin_ct, N3_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, N_all);
% [N3_prfrac_bin, N3_prfrac_bin_ct, N3_prfrac_bin_ctfr] =
% cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, N_all); [N3_prfrac_actual_bin,
% N3_prfrac_actual_bin_ct, N3_prfrac_actual_bin_ctfr] =
% cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, N_all);

[Area3_aos_bin, Area3_aos_bin_ct, Area3_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, Area_all);
[Area3_cwv_bin, Area3_cwv_bin_ct, Area3_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, Area_all);
[Area3_COP_bin, Area3_COP_bin_ct, Area3_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, Area_all);
[Area3_Iorg_bin, Area3_Iorg_bin_ct, Area3_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, Area_all);
[Area3_prfrac_bin, Area3_prfrac_bin_ct, Area3_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, Area_all);
[Area3_prfrac_actual_bin, Area3_prfrac_actual_bin_ct, Area3_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, Area_all);

[Pr3_aos_bin, Pr3_aos_bin_ct, Pr3_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, pr_mcs_all);
[Pr3_cwv_bin, Pr3_cwv_bin_ct, Pr3_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, pr_mcs_all);
[Pr3_COP_bin, Pr3_COP_bin_ct, Pr3_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, pr_mcs_all);
[Pr3_Iorg_bin, Pr3_Iorg_bin_ct, Pr3_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, pr_mcs_all);
[Pr3_prfrac_bin, Pr3_prfrac_bin_ct, Pr3_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, pr_mcs_all);
[Pr3_prfrac_actual_bin, Pr3_prfrac_actual_bin_ct, Pr3_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, pr_mcs_all);


%%----------------40x40------------------------------------------------------------
pr_mcs_all = [];
COP_all = [];
Iorg_all = [];
prfrac_mcs_all = [];
aos_all = [];
cwv_all = [];
cwv_mean_all = [];
N_all = [];
Area_all = [];
prfrac_actual_mcs_all = [];


for i = 1:3
    load(['Processed/recentered/pr_mcs_40x40_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/COP_40x40_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Iorg_40x40_every5_' num2str(i) '.mat']);
    %load(['Processed/recentered/prfrac_mcs_40x40_every5_' num2str(i) '.mat']);
    %prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    load(['Processed/recentered/aos_40x40_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_40x40_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_mean_40x40_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/N_40x40_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Area_40x40_every5_' num2str(i) '.mat']);
    %load(['Processed/recentered/prfrac_mcs_40x40_actual_every5_' num2str(i) '.mat']);
    %prfrac_actual_mcs_all = cat(1,prfrac_actual_mcs_all,prfrac_mcs);
    pr_mcs_all = cat(1,pr_mcs_all,pr_mcs);
    COP_all = cat(1,COP_all,COP);
    Iorg_all = cat(1,Iorg_all,Iorg);
    N_all = cat(1,N_all,N);
    Area_all = cat(1,Area_all,Area);
    aos_all = cat(1,aos_all,aos);
    cwv_all = cat(1,cwv_all,cwv);
    cwv_mean_all = cat(1,cwv_mean_all,cwv_mean);
end

cwv_all = cwv_all;
pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
prfrac_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
prfrac_actual_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
Iorg_bin = 0:0.05:0.70;
COP_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
aos_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
cwv_bin = 0:2:24;

% [N4_aos_bin, N4_aos_bin_ct, N4_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, N_all);
% [N4_cwv_bin, N4_cwv_bin_ct, N4_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, N_all);
% [N4_COP_bin, N4_COP_bin_ct, N4_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, N_all);
% [N4_Iorg_bin, N4_Iorg_bin_ct, N4_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, N_all);
% [N4_prfrac_bin, N4_prfrac_bin_ct, N4_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, N_all);
% [N4_prfrac_actual_bin, N4_prfrac_actual_bin_ct, N4_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, N_all);

[Area4_aos_bin, Area4_aos_bin_ct, Area4_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, Area_all);
[Area4_cwv_bin, Area4_cwv_bin_ct, Area4_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, Area_all);
[Area4_COP_bin, Area4_COP_bin_ct, Area4_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, Area_all);
[Area4_Iorg_bin, Area4_Iorg_bin_ct, Area4_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, Area_all);
[Area4_prfrac_bin, Area4_prfrac_bin_ct, Area4_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, Area_all);
[Area4_prfrac_actual_bin, Area4_prfrac_actual_bin_ct, Area4_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, Area_all);

[Pr4_aos_bin, Pr4_aos_bin_ct, Pr4_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, pr_mcs_all);
[Pr4_cwv_bin, Pr4_cwv_bin_ct, Pr4_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, pr_mcs_all);
[Pr4_COP_bin, Pr4_COP_bin_ct, Pr4_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, pr_mcs_all);
[Pr4_Iorg_bin, Pr4_Iorg_bin_ct, Pr4_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, pr_mcs_all);
[Pr4_prfrac_bin, Pr4_prfrac_bin_ct, Pr4_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, pr_mcs_all);
[Pr4_prfrac_actual_bin, Pr4_prfrac_actual_bin_ct, Pr4_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, pr_mcs_all);

%%----------------50x50------------------------------------------------------------
pr_mcs_all = [];
COP_all = [];
Iorg_all = [];
prfrac_mcs_all = [];
aos_all = [];
cwv_all = [];
cwv_mean_all = [];
N_all = [];
Area_all = [];
prfrac_actual_mcs_all = [];


for i = 1:3
    load(['Processed/recentered/pr_mcs_50x50_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/COP_50x50_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Iorg_50x50_every5_' num2str(i) '.mat']);
    %load(['Processed/recentered/prfrac_mcs_50x50_every5_' num2str(i) '.mat']);
    %prfrac_mcs_all = cat(1,prfrac_mcs_all,prfrac_mcs);
    load(['Processed/recentered/aos_50x50_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_50x50_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/cwv_mean_50x50_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/N_50x50_every5_' num2str(i) '.mat']);
    load(['Processed/recentered/Area_50x50_every5_' num2str(i) '.mat']);
    %load(['Processed/recentered/prfrac_mcs_50x50_actual_every5_' num2str(i) '.mat']);
    %prfrac_actual_mcs_all = cat(1,prfrac_actual_mcs_all,prfrac_mcs);
    pr_mcs_all = cat(1,pr_mcs_all,pr_mcs);
    COP_all = cat(1,COP_all,COP);
    Iorg_all = cat(1,Iorg_all,Iorg);
    N_all = cat(1,N_all,N);
    Area_all = cat(1,Area_all,Area);
    aos_all = cat(1,aos_all,aos);
    cwv_all = cat(1,cwv_all,cwv);
    cwv_mean_all = cat(1,cwv_mean_all,cwv_mean);
end

cwv_all = cwv_all;
pr_mcs_bin = [0,3,6,9,12,15,18,21,24,27,30];
prfrac_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
prfrac_actual_mcs_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
Iorg_bin = 0:0.05:0.70;
COP_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
aos_bin = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
cwv_bin = 0:2:24;

% [N5_aos_bin, N5_aos_bin_ct, N5_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, N_all);
% [N5_cwv_bin, N5_cwv_bin_ct, N5_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, N_all);
% [N5_COP_bin, N5_COP_bin_ct, N5_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, N_all);
% [N5_Iorg_bin, N5_Iorg_bin_ct, N5_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, N_all);
% [N5_prfrac_bin, N5_prfrac_bin_ct, N5_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, N_all);
% [N5_prfrac_actual_bin, N5_prfrac_actual_bin_ct, N5_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, N_all);

[Area5_aos_bin, Area5_aos_bin_ct, Area5_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, Area_all);
[Area5_cwv_bin, Area5_cwv_bin_ct, Area5_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, Area_all);
[Area5_COP_bin, Area5_COP_bin_ct, Area5_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, Area_all);
[Area5_Iorg_bin, Area5_Iorg_bin_ct, Area5_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, Area_all);
[Area5_prfrac_bin, Area5_prfrac_bin_ct, Area5_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, Area_all);
[Area5_prfrac_actual_bin, Area5_prfrac_actual_bin_ct, Area5_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, Area_all);

[Pr5_aos_bin, Pr5_aos_bin_ct, Pr5_aos_bin_ctfr] = cal_prvar(aos_bin, aos_all, pr_mcs_all);
[Pr5_cwv_bin, Pr5_cwv_bin_ct, Pr5_cwv_bin_ctfr] = cal_prvar(cwv_bin, cwv_all, pr_mcs_all);
[Pr5_COP_bin, Pr5_COP_bin_ct, Pr5_COP_bin_ctfr] = cal_prvar(COP_bin, COP_all, pr_mcs_all);
[Pr5_Iorg_bin, Pr5_Iorg_bin_ct, Pr5_Iorg_bin_ctfr] = cal_prvar(Iorg_bin, Iorg_all, pr_mcs_all);
[Pr5_prfrac_bin, Pr5_prfrac_bin_ct, Pr5_prfrac_bin_ctfr] = cal_prvar(prfrac_mcs_bin, prfrac_mcs_all, pr_mcs_all);
[Pr5_prfrac_actual_bin, Pr5_prfrac_actual_bin_ct, Pr5_prfrac_actual_bin_ctfr] = cal_prvar(prfrac_actual_mcs_bin, prfrac_actual_mcs_all, pr_mcs_all);

%%-------------------------------
% f1 = figure(1);
% clf;
% subplot(3,2,1);
% N1_aos_bin(N1_aos_bin==0) = NaN;
% N2_aos_bin(N2_aos_bin==0) = NaN;
% N3_aos_bin(N3_aos_bin==0) = NaN;
% N4_aos_bin(N4_aos_bin==0) = NaN;
% N5_aos_bin(N5_aos_bin==0) = NaN;
% h1 = plot(aos_bin,N1_aos_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
% h2 = plot(aos_bin,N2_aos_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
% h3 = plot(aos_bin,N3_aos_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
% h4 = plot(aos_bin,N4_aos_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
% h5 = plot(aos_bin,N5_aos_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
% axis([0 1 0 100]);
% xlabel('AOS','FontSize',13);
% ylabel('N','FontSize',13);
% legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northeast','LineWidth',2);
% title('AOS VS number of MCSs in the domain','FontSize',13)
% 
% subplot(3,2,2);
% N1_cwv_bin(N1_cwv_bin==0) = NaN;
% N2_cwv_bin(N2_cwv_bin==0) = NaN;
% N3_cwv_bin(N3_cwv_bin==0) = NaN;
% N4_cwv_bin(N4_cwv_bin==0) = NaN;
% N5_cwv_bin(N5_cwv_bin==0) = NaN;
% h1 = plot(cwv_bin,N1_cwv_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
% h2 = plot(cwv_bin,N2_cwv_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
% h3 = plot(cwv_bin,N3_cwv_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
% h4 = plot(cwv_bin,N4_cwv_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
% h5 = plot(cwv_bin,N5_cwv_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
% axis([2 18 0 100]);
% xlabel('\sigmacwv/1e+07','FontSize',13);
% ylabel('N','FontSize',13);
% %legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northeast','LineWidth',2);
% title('\sigmacwv VS number of MCSs in the domain','FontSize',13)
% 
% subplot(3,2,3);
% N1_COP_bin(N1_COP_bin==0) = NaN;
% N2_COP_bin(N2_COP_bin==0) = NaN;
% N3_COP_bin(N3_COP_bin==0) = NaN;
% N4_COP_bin(N4_COP_bin==0) = NaN;
% N5_COP_bin(N5_COP_bin==0) = NaN;
% h1 = plot(COP_bin,N1_COP_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
% h2 = plot(COP_bin,N2_COP_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
% h3 = plot(COP_bin,N3_COP_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
% h4 = plot(COP_bin,N4_COP_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
% h5 = plot(COP_bin,N5_COP_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
% axis([0 1 0 100]);
% xlabel('COP','FontSize',13);
% ylabel('N','FontSize',13);
% legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northeast','LineWidth',2);
% title('COP VS number of MCSs in the domain','FontSize',13)
% 
% subplot(3,2,4);
% N1_Iorg_bin(N1_Iorg_bin==0) = NaN;
% N2_Iorg_bin(N2_Iorg_bin==0) = NaN;
% N3_Iorg_bin(N3_Iorg_bin==0) = NaN;
% N4_Iorg_bin(N4_Iorg_bin==0) = NaN;
% N5_Iorg_bin(N5_Iorg_bin==0) = NaN;
% h1 = plot(Iorg_bin,N1_Iorg_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
% h2 = plot(Iorg_bin,N2_Iorg_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
% h3 = plot(Iorg_bin,N3_Iorg_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
% h4 = plot(Iorg_bin,N4_Iorg_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
% h5 = plot(Iorg_bin,N5_Iorg_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
% axis([0 0.7 0 100]);
% xlabel('I_o_r_g','FontSize',13);
% ylabel('N','FontSize',13);
% legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northwest','LineWidth',2);
% title('I_o_r_g VS number of MCSs in the domain','FontSize',13)
% 
% subplot(3,2,5);
% N1_prfrac_bin(N1_prfrac_bin==0) = NaN;
% N2_prfrac_bin(N2_prfrac_bin==0) = NaN;
% N3_prfrac_bin(N3_prfrac_bin==0) = NaN;
% N4_prfrac_bin(N4_prfrac_bin==0) = NaN;
% N5_prfrac_bin(N5_prfrac_bin==0) = NaN;
% h1 = plot(prfrac_mcs_bin,N1_prfrac_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
% h2 = plot(prfrac_mcs_bin,N2_prfrac_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
% h3 = plot(prfrac_mcs_bin,N3_prfrac_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
% h4 = plot(prfrac_mcs_bin,N4_prfrac_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
% h5 = plot(prfrac_mcs_bin,N5_prfrac_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
% axis([0 1 0 100]);
% xlabel('Area Frac Precipitating of MCS','FontSize',13);
% ylabel('N','FontSize',13);
% legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northeast','LineWidth',2);
% title('Area Frac Precipitating of MCS VS number of MCSs in the domain','FontSize',13)
% 
% subplot(3,2,6);
% N1_prfrac_actual_bin(N1_prfrac_actual_bin==0) = NaN;
% N2_prfrac_actual_bin(N2_prfrac_actual_bin==0) = NaN;
% N3_prfrac_actual_bin(N3_prfrac_actual_bin==0) = NaN;
% N4_prfrac_actual_bin(N4_prfrac_actual_bin==0) = NaN;
% N5_prfrac_actual_bin(N5_prfrac_actual_bin==0) = NaN;
% h1 = plot(prfrac_actual_mcs_bin,N1_prfrac_actual_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
% h2 = plot(prfrac_actual_mcs_bin,N2_prfrac_actual_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
% h3 = plot(prfrac_actual_mcs_bin,N3_prfrac_actual_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
% h4 = plot(prfrac_actual_mcs_bin,N4_prfrac_actual_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
% h5 = plot(prfrac_actual_mcs_bin,N5_prfrac_actual_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
% axis([0 1 0 100]);
% xlabel('Precip Frac of MCS','FontSize',13);
% ylabel('N','FontSize',13);
% legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northeast','LineWidth',2);
% title('Precip Frac of MCS VS number of MCSs in the domain','FontSize',13)


%%-------------------------------
f1 = figure(1);
clf;
subplot(3,2,5);
Area1_aos_bin(Area1_aos_bin==0) = NaN;
Area2_aos_bin(Area2_aos_bin==0) = NaN;
Area3_aos_bin(Area3_aos_bin==0) = NaN;
Area4_aos_bin(Area4_aos_bin==0) = NaN;
Area5_aos_bin(Area5_aos_bin==0) = NaN;
h1 = plot(aos_bin(1:end-1)+0.05,Area1_aos_bin(1:end-1),'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(aos_bin(1:end-1)+0.05,Area2_aos_bin(1:end-1),'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(aos_bin(1:end-1)+0.05,Area3_aos_bin(1:end-1),'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(aos_bin(1:end-1)+0.05,Area4_aos_bin(1:end-1),'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(aos_bin(1:end-1)+0.05,Area5_aos_bin(1:end-1),'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 1 0 250]);
set(gca,'FontSize',14)
xlabel('AOS','FontSize',15);
ylabel('Mean MCS Area (0.25^ox0.25^o)','FontSize',15);
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northeast','LineWidth',2);
text(0,275,'(e)','FontSize',17,'fontweight', 'bold');
title('AOS','FontSize',17)

subplot(3,2,6);
Area1_cwv_bin(Area1_cwv_bin==0) = NaN;
Area2_cwv_bin(Area2_cwv_bin==0) = NaN;
Area3_cwv_bin(Area3_cwv_bin==0) = NaN;
Area4_cwv_bin(Area4_cwv_bin==0) = NaN;
Area5_cwv_bin(Area5_cwv_bin==0) = NaN;
h1 = plot(cwv_bin(1:end-1)+1,Area1_cwv_bin(1:end-1),'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(cwv_bin(1:end-1)+1,Area2_cwv_bin(1:end-1),'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(cwv_bin(1:end-1)+1,Area3_cwv_bin(1:end-1),'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(cwv_bin(1:end-1)+1,Area4_cwv_bin(1:end-1),'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(cwv_bin(1:end-1)+1,Area5_cwv_bin(1:end-1),'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 21 0 250]);
set(gca,'FontSize',14)
xlabel('\sigmacwv (mm)','FontSize',15);
ylabel('Mean MCS Area (0.25^ox0.25^o)','FontSize',15);
text(0,275,'(f)','FontSize',17,'fontweight', 'bold');
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','north','LineWidth',2);
title('\sigmacwv','FontSize',17)

subplot(3,2,4);
Area1_COP_bin(Area1_COP_bin==0) = NaN;
Area2_COP_bin(Area2_COP_bin==0) = NaN;
Area3_COP_bin(Area3_COP_bin==0) = NaN;
Area4_COP_bin(Area4_COP_bin==0) = NaN;
Area5_COP_bin(Area5_COP_bin==0) = NaN;
h1 = plot(COP_bin(1:end)+0.05,Area1_COP_bin(1:end),'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(COP_bin(1:end)+0.05,Area2_COP_bin(1:end),'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(COP_bin(1:end)+0.05,Area3_COP_bin(1:end),'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(COP_bin(1:end)+0.05,Area4_COP_bin(1:end),'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(COP_bin(1:end)+0.05,Area5_COP_bin(1:end),'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 1.1 0 500]);
set(gca,'FontSize',14)
xlabel('COP','FontSize',15);
text(0,550,'(d)','FontSize',17,'fontweight', 'bold');
ylabel('Mean MCS Area (0.25^ox0.25^o)','FontSize',15);
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northwest','LineWidth',2);
title('COP','FontSize',17)

subplot(3,2,1);
Area1_Iorg_bin(Area1_Iorg_bin==0) = NaN;
Area2_Iorg_bin(Area2_Iorg_bin==0) = NaN;
Area3_Iorg_bin(Area3_Iorg_bin==0) = NaN;
Area4_Iorg_bin(Area4_Iorg_bin==0) = NaN;
Area5_Iorg_bin(Area5_Iorg_bin==0) = NaN;
h1 = plot(Iorg_bin(1:end)+0.05,Area1_Iorg_bin(1:end),'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(Iorg_bin(1:end)+0.05,Area2_Iorg_bin(1:end),'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(Iorg_bin(1:end)+0.05,Area3_Iorg_bin(1:end),'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(Iorg_bin(1:end)+0.05,Area4_Iorg_bin(1:end),'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(Iorg_bin(1:end)+0.05,Area5_Iorg_bin(1:end),'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 0.8 0 250]);
set(gca,'FontSize',14)
xlabel('Iorg','FontSize',15);
ylabel('Mean MCS Area (0.25^ox0.25^o)','FontSize',15);
text(0,275,'(a)','FontSize',17,'fontweight', 'bold');
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','north','LineWidth',2);
title('Iorg','FontSize',17)

subplot(3,2,2);
Area1_prfrac_bin(Area1_prfrac_bin==0) = NaN;
Area2_prfrac_bin(Area2_prfrac_bin==0) = NaN;
Area3_prfrac_bin(Area3_prfrac_bin==0) = NaN;
Area4_prfrac_bin(Area4_prfrac_bin==0) = NaN;
Area5_prfrac_bin(Area5_prfrac_bin==0) = NaN;
h1 = plot(prfrac_mcs_bin(1:end-1)+0.05,Area1_prfrac_bin(1:end-1),'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(prfrac_mcs_bin(1:end-1)+0.05,Area2_prfrac_bin(1:end-1),'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(prfrac_mcs_bin(1:end-1)+0.05,Area3_prfrac_bin(1:end-1),'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(prfrac_mcs_bin(1:end-1)+0.05,Area4_prfrac_bin(1:end-1),'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(prfrac_mcs_bin(1:end-1)+0.05,Area5_prfrac_bin(1:end-1),'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 1 0 1500]);
set(gca,'FontSize',14)
xlabel('Aorg','FontSize',15);
ylabel('Mean MCS Area (0.25^ox0.25^o)','FontSize',15);
text(0,1650,'(b)','FontSize',17,'fontweight', 'bold');
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northwest','LineWidth',2);
title('Aorg','FontSize',17)

subplot(3,2,3);
Area1_prfrac_actual_bin(Area1_prfrac_actual_bin==0) = NaN;
Area2_prfrac_actual_bin(Area2_prfrac_actual_bin==0) = NaN;
Area3_prfrac_actual_bin(Area3_prfrac_actual_bin==0) = NaN;
Area4_prfrac_actual_bin(Area4_prfrac_actual_bin==0) = NaN;
Area5_prfrac_actual_bin(Area5_prfrac_actual_bin==0) = NaN;
h1 = plot(prfrac_actual_mcs_bin(1:end-1)+0.05,Area1_prfrac_actual_bin(1:end-1),'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(prfrac_actual_mcs_bin(1:end-1)+0.05,Area2_prfrac_actual_bin(1:end-1),'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(prfrac_actual_mcs_bin(1:end-1)+0.05,Area3_prfrac_actual_bin(1:end-1),'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(prfrac_actual_mcs_bin(1:end-1)+0.05,Area4_prfrac_actual_bin(1:end-1),'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(prfrac_actual_mcs_bin(1:end-1)+0.05,Area5_prfrac_actual_bin(1:end-1),'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 1 0 250]);
set(gca,'FontSize',14)
xlabel('Forg','FontSize',15);
ylabel('Mean MCS Area (0.25^ox0.25^o)','FontSize',15);
text(0,275,'(c)','FontSize',17,'fontweight', 'bold');
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northwest','LineWidth',2);
title('Forg','FontSize',17)


%%-------------------------------
f1 = figure(1);
clf;
subplot(3,2,1);
Pr1_aos_bin(Pr1_aos_bin==0) = NaN;
Pr2_aos_bin(Pr2_aos_bin==0) = NaN;
Pr3_aos_bin(Pr3_aos_bin==0) = NaN;
Pr4_aos_bin(Pr4_aos_bin==0) = NaN;
Pr5_aos_bin(Pr5_aos_bin==0) = NaN;
h1 = plot(aos_bin(1:end-1)+0.05,Pr1_aos_bin(1:end-1),'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(aos_bin(1:end-1)+0.05,Pr2_aos_bin(1:end-1),'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(aos_bin(1:end-1)+0.05,Pr3_aos_bin(1:end-1),'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(aos_bin(1:end-1)+0.05,Pr4_aos_bin(1:end-1),'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(aos_bin(1:end-1)+0.05,Pr5_aos_bin(1:end-1),'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 1 0 5]);
xlabel('AOS','FontSize',13);
ylabel('Precip (mm/hr)','FontSize',13);
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','north','LineWidth',2);
title('AOS VS Precip of MCSs in the domain','FontSize',13)

subplot(3,2,2);
Pr1_cwv_bin(Pr1_cwv_bin==0) = NaN;
Pr2_cwv_bin(Pr2_cwv_bin==0) = NaN;
Pr3_cwv_bin(Pr3_cwv_bin==0) = NaN;
Pr4_cwv_bin(Pr4_cwv_bin==0) = NaN;
Pr5_cwv_bin(Pr5_cwv_bin==0) = NaN;
h1 = plot(cwv_bin(1:end-1)+1,Pr1_cwv_bin(1:end-1),'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(cwv_bin(1:end-1)+1,Pr2_cwv_bin(1:end-1),'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(cwv_bin(1:end-1)+1,Pr3_cwv_bin(1:end-1),'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(cwv_bin(1:end-1)+1,Pr4_cwv_bin(1:end-1),'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(cwv_bin(1:end-1)+1,Pr5_cwv_bin(1:end-1),'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 21 0 5]);
xlabel('\sigmacwv','FontSize',13);
ylabel('Precip (mm/hr)','FontSize',13);
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','north','LineWidth',2);
title('\sigmacwv VS Precip of MCSs in the domain','FontSize',13)

subplot(3,2,3);
Pr1_COP_bin(Pr1_COP_bin==0) = NaN;
Pr2_COP_bin(Pr2_COP_bin==0) = NaN;
Pr3_COP_bin(Pr3_COP_bin==0) = NaN;
Pr4_COP_bin(Pr4_COP_bin==0) = NaN;
Pr5_COP_bin(Pr5_COP_bin==0) = NaN;
h1 = plot(COP_bin,Pr1_COP_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(COP_bin,Pr2_COP_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(COP_bin,Pr3_COP_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(COP_bin,Pr4_COP_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(COP_bin,Pr5_COP_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 1 0 5]);
xlabel('COP','FontSize',13);
ylabel('Precip','FontSize',13);
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northwest','LineWidth',2);
title('COP VS Precip of MCSs in the domain','FontSize',13)

subplot(3,2,4);
Pr1_Iorg_bin(Pr1_Iorg_bin==0) = NaN;
Pr2_Iorg_bin(Pr2_Iorg_bin==0) = NaN;
Pr3_Iorg_bin(Pr3_Iorg_bin==0) = NaN;
Pr4_Iorg_bin(Pr4_Iorg_bin==0) = NaN;
Pr5_Iorg_bin(Pr5_Iorg_bin==0) = NaN;
h1 = plot(Iorg_bin,Pr1_Iorg_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(Iorg_bin,Pr2_Iorg_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(Iorg_bin,Pr3_Iorg_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(Iorg_bin,Pr4_Iorg_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(Iorg_bin,Pr5_Iorg_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 0.7 0 5]);
xlabel('I_o_r_g','FontSize',13);
ylabel('Precip','FontSize',13);
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','north','LineWidth',2);
title('I_o_r_g VS Precip of MCSs in the domain','FontSize',13)

subplot(3,2,5);
Pr1_prfrac_bin(Pr1_prfrac_bin==0) = NaN;
Pr2_prfrac_bin(Pr2_prfrac_bin==0) = NaN;
Pr3_prfrac_bin(Pr3_prfrac_bin==0) = NaN;
Pr4_prfrac_bin(Pr4_prfrac_bin==0) = NaN;
Pr5_prfrac_bin(Pr5_prfrac_bin==0) = NaN;
h1 = plot(prfrac_mcs_bin,Pr1_prfrac_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(prfrac_mcs_bin,Pr2_prfrac_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(prfrac_mcs_bin,Pr3_prfrac_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(prfrac_mcs_bin,Pr4_prfrac_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(prfrac_mcs_bin,Pr5_prfrac_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 1 0 5]);
xlabel('Area Frac Precipitating of MCS','FontSize',13);
ylabel('Precip','FontSize',13);
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northwest','LineWidth',2);
title('Area Frac Precipitating of MCS VS Precip of MCSs in the domain','FontSize',13)

subplot(3,2,6);
Pr1_prfrac_actual_bin(Pr1_prfrac_actual_bin==0) = NaN;
Pr2_prfrac_actual_bin(Pr2_prfrac_actual_bin==0) = NaN;
Pr3_prfrac_actual_bin(Pr3_prfrac_actual_bin==0) = NaN;
Pr4_prfrac_actual_bin(Pr4_prfrac_actual_bin==0) = NaN;
Pr5_prfrac_actual_bin(Pr5_prfrac_actual_bin==0) = NaN;
h1 = plot(prfrac_actual_mcs_bin,Pr1_prfrac_actual_bin,'color', [0 0.4470 0.7410],'LineWidth',2);hold on;
h2 = plot(prfrac_actual_mcs_bin,Pr2_prfrac_actual_bin,'color', [0.8500 0.3250 0.0980],'LineWidth',2);hold on;
h3 = plot(prfrac_actual_mcs_bin,Pr3_prfrac_actual_bin,'color', [0.4940 0.1840 0.5560],'LineWidth',2);hold on;
h4 = plot(prfrac_actual_mcs_bin,Pr4_prfrac_actual_bin,'color', [0.4660 0.6740 0.1880],'LineWidth',2);hold on;
h5 = plot(prfrac_actual_mcs_bin,Pr5_prfrac_actual_bin,'color', [0.6350 0.0780 0.1840],'LineWidth',2);hold on;
axis([0 1 0 5]);
xlabel('Precip Frac of MCS','FontSize',13);
ylabel('Precip','FontSize',13);
legend({'10^ox10^o','20^ox20^o','30^ox30^o','40^ox40^o','50^ox50^o'},'FontSize',11,'Location','northwest','LineWidth',2);
title('Precip Frac of MCS VS Precip of MCSs in the domain','FontSize',13)

