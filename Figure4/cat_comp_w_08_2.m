%with zero rain pixels
%clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

%%----------------'num2str(k)'0 x 'num2str(k)'0------------------------------------------------------------
for k = 1:1
w_mcs_08_c1 = [];
w_mcs_08_c2 = [];
w_mcs_08_c3 = [];
w_mcs_08_c4 = [];
w_nomcs_08_c1 = [];
w_nomcs_08_c2 = [];
w_nomcs_08_c3 = [];
w_nomcs_08_c4 = [];

for yy = 2007:2012
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn1 = ['/neelin2020/ACRE/Processed_ACRE_revised/MCS_PRfracactual_w_spat_ave_08_' yyyy mm dd '.mat']
    load(fn1)

    w_mcs_08_c1 = cat(1,w_mcs_08_c1,cell2mat(cell_w_08(:,1)));
    w_mcs_08_c2 = cat(1,w_mcs_08_c2,cell2mat(cell_w_08(:,2)));
    w_mcs_08_c3 = cat(1,w_mcs_08_c3,cell2mat(cell_w_08(:,3)));
    w_mcs_08_c4 = cat(1,w_mcs_08_c4,cell2mat(cell_w_08(:,4)));
    w_nomcs_08_c1 = cat(1,w_nomcs_08_c1,cell2mat(cell_w_08(:,5)));
    w_nomcs_08_c2 = cat(1,w_nomcs_08_c2,cell2mat(cell_w_08(:,6)));
    w_nomcs_08_c3 = cat(1,w_nomcs_08_c3,cell2mat(cell_w_08(:,7)));
    w_nomcs_08_c4 = cat(1,w_nomcs_08_c4,cell2mat(cell_w_08(:,8)));
end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/w_mcs_08_c1_2.mat'],'w_mcs_08_c1');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_mcs_08_c2_2.mat'],'w_mcs_08_c2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_mcs_08_c3_2.mat'],'w_mcs_08_c3');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_mcs_08_c4_2.mat'],'w_mcs_08_c4');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_nomcs_08_c1_2.mat'],'w_nomcs_08_c1');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_nomcs_08_c2_2.mat'],'w_nomcs_08_c2');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_nomcs_08_c3_2.mat'],'w_nomcs_08_c3');
save(['/neelin2020/ACRE/Processed_ACRE_revised/w_nomcs_08_c4_2.mat'],'w_nomcs_08_c4');
end
