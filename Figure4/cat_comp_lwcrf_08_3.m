%with zero rain pixels
%clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

%%----------------'num2str(k)'0 x 'num2str(k)'0------------------------------------------------------------
for k = 1:1
lwcrf_mcs_08_c1 = [];
lwcrf_mcs_08_c2 = [];
lwcrf_mcs_08_c3 = [];
lwcrf_mcs_08_c4 = [];
lwcrf_nomcs_08_c1 = [];
lwcrf_nomcs_08_c2 = [];
lwcrf_nomcs_08_c3 = [];
lwcrf_nomcs_08_c4 = [];

for yy = 2013:2017
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn1 = ['/neelin2020/ACRE/Processed_ACRE_revised/MCS_PRfracactual_lwcrf_spat_ave_08_' yyyy mm dd '.mat']
    load(fn1)

    lwcrf_mcs_08_c1 = cat(1,lwcrf_mcs_08_c1,cell2mat(cell_lwcrf_08(:,1)));
    lwcrf_mcs_08_c2 = cat(1,lwcrf_mcs_08_c2,cell2mat(cell_lwcrf_08(:,2)));
    lwcrf_mcs_08_c3 = cat(1,lwcrf_mcs_08_c3,cell2mat(cell_lwcrf_08(:,3)));
    lwcrf_mcs_08_c4 = cat(1,lwcrf_mcs_08_c4,cell2mat(cell_lwcrf_08(:,4)));
    lwcrf_nomcs_08_c1 = cat(1,lwcrf_nomcs_08_c1,cell2mat(cell_lwcrf_08(:,5)));
    lwcrf_nomcs_08_c2 = cat(1,lwcrf_nomcs_08_c2,cell2mat(cell_lwcrf_08(:,6)));
    lwcrf_nomcs_08_c3 = cat(1,lwcrf_nomcs_08_c3,cell2mat(cell_lwcrf_08(:,7)));
    lwcrf_nomcs_08_c4 = cat(1,lwcrf_nomcs_08_c4,cell2mat(cell_lwcrf_08(:,8)));
end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_mcs_08_c1_3.mat'],'lwcrf_mcs_08_c1');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_mcs_08_c2_3.mat'],'lwcrf_mcs_08_c2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_mcs_08_c3_3.mat'],'lwcrf_mcs_08_c3');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_mcs_08_c4_3.mat'],'lwcrf_mcs_08_c4');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_nomcs_08_c1_3.mat'],'lwcrf_nomcs_08_c1');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_nomcs_08_c2_3.mat'],'lwcrf_nomcs_08_c2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_nomcs_08_c3_3.mat'],'lwcrf_nomcs_08_c3');
save(['/neelin2020/ACRE/Processed_ACRE_revised/lwcrf_nomcs_08_c4_3.mat'],'lwcrf_nomcs_08_c4');
end
