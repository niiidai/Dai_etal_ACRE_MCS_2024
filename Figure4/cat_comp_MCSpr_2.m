%with zero rain pixels
%clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

%%----------------'num2str(k)'0 x 'num2str(k)'0------------------------------------------------------------
for k = 1:1
mcs_pr = [];

for yy = 2007:2012
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn1 = ['/neelin2020/ACRE/Processed_ACRE_revised/MCS_pr_ind_' yyyy mm dd '_largeonly.mat']
    load(fn1)

    mcs_pr = cat(1,mcs_pr,cell2mat(cell_mcs_pr(:,1)));
end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/mcs_pr_largeonly_2.mat'],'mcs_pr');
end
