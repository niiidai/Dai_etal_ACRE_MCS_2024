%with zero rain pixels
%clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

%%----------------'num2str(k)'0 x 'num2str(k)'0------------------------------------------------------------
for k = 1:1
w_mcs_02_c1 = [];
w_mcs_02_c2 = [];
w_mcs_02_c3 = [];
w_mcs_02_c4 = [];
w_nomcs_02_c1 = [];
w_nomcs_02_c2 = [];
w_nomcs_02_c3 = [];
w_nomcs_02_c4 = [];

for yy = 2001:2006
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn1 = ['/neelin2020/ACRE/Processed_ACRE_revised/MCS_PRfracactual_w_spat_ave_02_' yyyy mm dd '.mat']
    load(fn1)

    w_mcs_02_c1 = cat(1,w_mcs_02_c1,cell2mat(cell_w_02(:,1)));
    w_mcs_02_c2 = cat(1,w_mcs_02_c2,cell2mat(cell_w_02(:,2)));
    w_mcs_02_c3 = cat(1,w_mcs_02_c3,cell2mat(cell_w_02(:,3)));
    w_mcs_02_c4 = cat(1,w_mcs_02_c4,cell2mat(cell_w_02(:,4)));
    w_nomcs_02_c1 = cat(1,w_nomcs_02_c1,cell2mat(cell_w_02(:,5)));
    w_nomcs_02_c2 = cat(1,w_nomcs_02_c2,cell2mat(cell_w_02(:,6)));
    w_nomcs_02_c3 = cat(1,w_nomcs_02_c3,cell2mat(cell_w_02(:,7)));
    w_nomcs_02_c4 = cat(1,w_nomcs_02_c4,cell2mat(cell_w_02(:,8)));
end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/w_mcs_02_c1_1.mat'],'w_mcs_02_c1');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_mcs_02_c2_1.mat'],'w_mcs_02_c2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_mcs_02_c3_1.mat'],'w_mcs_02_c3');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_mcs_02_c4_1.mat'],'w_mcs_02_c4');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_nomcs_02_c1_1.mat'],'w_nomcs_02_c1');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_nomcs_02_c2_1.mat'],'w_nomcs_02_c2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_nomcs_02_c3_1.mat'],'w_nomcs_02_c3');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_nomcs_02_c4_1.mat'],'w_nomcs_02_c4');
end
