%with zero rain pixels
%clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

%%----------------'num2str(k)'0 x 'num2str(k)'0------------------------------------------------------------
for k = 1:1
vv_mcs = [];
vv_nonmcs = [];
vv_nonmcs_pr2 = [];
vv_nonmcs_dry2 = [];
vv_mcs_pr2 = [];
vv_mcs_dry2 = [];

for yy = 2007:2012
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn2 = ['/neelin2020/ACRE/Processed_ACRE_revised/MCS_std_ceres_vv_' num2str(k) '0x' num2str(k) '0rc_' yyyy mm dd '_new_ave.mat']
    load(fn2)

    vv_mcs = cat(1,vv_mcs,cell2mat(cell_vv(:,1)));
    vv_nonmcs = cat(1,vv_nonmcs,cell2mat(cell_vv(:,2)));
    vv_nonmcs_pr2 = cat(1,vv_nonmcs_pr2,cell2mat(cell_vv(:,3)));
    vv_nonmcs_dry2 = cat(1,vv_nonmcs_dry2,cell2mat(cell_vv(:,4)));
    vv_mcs_pr2 = cat(1,vv_mcs_pr2,cell2mat(cell_vv(:,5)));
    vv_mcs_dry2 = cat(1,vv_mcs_dry2,cell2mat(cell_vv(:,6)));
end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/vv_mcs_' num2str(k) '0x' num2str(k) '0_new_2.mat'],'vv_mcs');
save(['/neelin2020/ACRE/Processed_ACRE_revised/vv_nonmcs_' num2str(k) '0x' num2str(k) '0_new_2.mat'],'vv_nonmcs');
save(['/neelin2020/ACRE/Processed_ACRE_revised/vv_nonmcs_pr2_' num2str(k) '0x' num2str(k) '0_new_2.mat'],'vv_nonmcs_pr2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/vv_nonmcs_dry2_' num2str(k) '0x' num2str(k) '0_new_2.mat'],'vv_nonmcs_dry2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/vv_mcs_pr2_' num2str(k) '0x' num2str(k) '0_new_2.mat'],'vv_mcs_pr2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/vv_mcs_dry2_' num2str(k) '0x' num2str(k) '0_new_2.mat'],'vv_mcs_dry2');
end
