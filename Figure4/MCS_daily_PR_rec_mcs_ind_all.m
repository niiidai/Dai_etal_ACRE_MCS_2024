%with zero rain pixels
clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

xdim=360; ydim=50; mo = 4; mo1 = (mo*2+1)*4;
xdim_ori=1440; ydim_ori=200;
lon=(0.5:1:359.5)';
lat=(-24.5:1:24.5)';
lon_ori=(0.125:0.25:360-0.125)';
lat_ori=(-24.875:0.25:24.875)';

IMERG_hr = {'S000000-E002959.0000','S010000-E012959.0060','S020000-E022959.0120',...
            'S030000-E032959.0180','S040000-E042959.0240','S050000-E052959.0300',...
            'S060000-E062959.0360','S070000-E072959.0420','S080000-E082959.0480',...
            'S090000-E092959.0540','S100000-E102959.0600','S110000-E112959.0660',...
            'S120000-E122959.0720','S130000-E132959.0780','S140000-E142959.0840',...
            'S150000-E152959.0900','S160000-E162959.0960','S170000-E172959.1020',...
            'S180000-E182959.1080','S190000-E192959.1140','S200000-E202959.1200',...
            'S210000-E212959.1260','S220000-E222959.1320','S230000-E232959.1380'};

IMERG_hr = char(IMERG_hr);

%%---------------------------------------
for yy = 2001:2017
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    cell_mcs_pr = {};
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
    load(fn_mcs);
    for hr = 1:2:48
        fn_pr = ['/neelin2020/ACRE/IMERG/3B-HHR.MS.MRG.3IMERG.' yyyy mm dd '-' IMERG_hr((hr+1)/2,:) '.V06B.HDF5_re025.nc'];
        pr = ncread(fn_pr,'precipitationCal'); 
        pr(pr<-1000.) = NaN;
        pr = permute(pr,[2 1]);
        pr(pr<=0) = NaN;
        
        CC = bwconncomp(ir_mcs_mask(:,:,hr));
        for i = 1:length(CC.PixelIdxList)
            cell_mcs_pr(end+1,:) = {mean(pr(CC.PixelIdxList{i}),'omitnan'),hr}; 
        end
    end
    save(['/neelin2020/ACRE/Processed_ACRE_revised/MCS_pr_ind_' yyyy mm dd '_all.mat'],'cell_mcs_pr');
    clear cell_mcs_pr;
end
end
end

