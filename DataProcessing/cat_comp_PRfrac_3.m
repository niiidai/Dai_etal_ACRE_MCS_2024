%with zero rain pixels
%clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

%%----------------'num2str(k)'0 x 'num2str(k)'0------------------------------------------------------------
for k = 1:1
prfrac = [];

for yy = 2013:2017
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn1 = ['/neelin2020/ACRE/Processed_ACRE_revised/MCS_prfracactual_' num2str(k) '0x' num2str(k) '0rc_' yyyy mm dd '_new.mat']
    load(fn1)

    prfrac = cat(1,prfrac,cell2mat(cell_prfrac(:,1)));
end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/prfracactual_' num2str(k) '0x' num2str(k) '0_new_3.mat'],'prfrac');
end
