%with zero rain pixels
%clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

%%----------------'num2str(k)'0 x 'num2str(k)'0------------------------------------------------------------
for k = 1:1
lwcrf_mcs = [];
lwcrf_nonmcs = [];
lwcrf_nonmcs_pr2 = [];
lwcrf_nonmcs_dry2 = [];
lwcrf_mcs_pr2 = [];
lwcrf_mcs_dry2 = [];

for yy = 2013:2017
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn2 = ['/neelin2020/ACRE/Processed_ACRE_revised/MCS_std_ceres_lwcrf_' num2str(k) '0x' num2str(k) '0rc_' yyyy mm dd '_new_ave.mat']
    load(fn2)

    lwcrf_mcs = cat(1,lwcrf_mcs,cell2mat(cell_lwcrf(:,1)));
    lwcrf_nonmcs = cat(1,lwcrf_nonmcs,cell2mat(cell_lwcrf(:,2)));
    lwcrf_nonmcs_pr2 = cat(1,lwcrf_nonmcs_pr2,cell2mat(cell_lwcrf(:,3)));
    lwcrf_nonmcs_dry2 = cat(1,lwcrf_nonmcs_dry2,cell2mat(cell_lwcrf(:,4)));
    lwcrf_mcs_pr2 = cat(1,lwcrf_mcs_pr2,cell2mat(cell_lwcrf(:,5)));
    lwcrf_mcs_dry2 = cat(1,lwcrf_mcs_dry2,cell2mat(cell_lwcrf(:,6)));
end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_mcs_' num2str(k) '0x' num2str(k) '0_new_3.mat'],'lwcrf_mcs');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_nonmcs_' num2str(k) '0x' num2str(k) '0_new_3.mat'],'lwcrf_nonmcs');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_nonmcs_pr2_' num2str(k) '0x' num2str(k) '0_new_3.mat'],'lwcrf_nonmcs_pr2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_nonmcs_dry2_' num2str(k) '0x' num2str(k) '0_new_3.mat'],'lwcrf_nonmcs_dry2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_mcs_pr2_' num2str(k) '0x' num2str(k) '0_new_3.mat'],'lwcrf_mcs_pr2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_mcs_dry2_' num2str(k) '0x' num2str(k) '0_new_3.mat'],'lwcrf_mcs_dry2');
end
