%with zero rain pixels
clear all;
addpath('../Shared');
addpath('../Project4');

xdim=1440; ydim=200; mo = 19;
%mo = 19 is for 10x10 degree box, mo = 39 for 20x20 degree box, and mo = 59 for 30x30 etc.

lon=(0.125:0.25:360-0.125)';
lat=(-24.875:0.25:24.875)';

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
startdate = datenum(yy,mon,01);
enddate = datenum(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    cell_pr = {};
    yyyy = datestr(date,'yyyy');
    mm = datestr(date,'mm');
    dd = datestr(date,'dd');
    fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
    load(fn_mcs);
    for hr = 1:2:48
        fn_pr = ['/neelin2020/ACRE/IMERG/3B-HHR.MS.MRG.3IMERG.' yyyy mm dd '-' IMERG_hr((hr+1)/2,:) '.V06B.HDF5_re025.nc'];
        pr = ncread(fn_pr,'precipitationCal'); 
        pr(pr<-1000.) = NaN;
        pr = permute(pr,[2 1]);
        for j = 20:20:180
            for i = 0:20:1420
                   if j-mo < 1 || j+mo>ydim
                      continue
                   elseif j-mo>=1 && j+mo<=ydim && i-mo<1
                      ir_mcs_mask_tmp = [squeeze(ir_mcs_mask((xdim+i-mo):xdim,j-mo:j+mo,hr));squeeze(ir_mcs_mask(1:(i+mo),j-mo:j+mo,hr))];
                      ir_nomcs_mask_tmp = [squeeze(ir_nomcs_mask((xdim+i-mo):xdim,j-mo:j+mo,hr));squeeze(ir_nomcs_mask(1:(i+mo),j-mo:j+mo,hr))];
                      pr_tmp = [pr((xdim+i-mo):xdim,j-mo:j+mo);pr(1:(i+mo),j-mo:j+mo)];
                   elseif j-mo>=1 && j+mo<=ydim && i+mo>xdim
                      ir_mcs_mask_tmp = [squeeze(ir_mcs_mask((i-mo):xdim,j-mo:j+mo,hr));squeeze(ir_mcs_mask(1:(i+mo-xdim),j-mo:j+mo,hr))];
                      ir_nomcs_mask_tmp = [squeeze(ir_nomcs_mask((i-mo):xdim,j-mo:j+mo,hr));squeeze(ir_nomcs_mask(1:(i+mo-xdim),j-mo:j+mo,hr))];
                      pr_tmp = [pr((i-mo):xdim,j-mo:j+mo);pr(1:(i+mo-xdim),j-mo:j+mo)];
                   else
                      ir_mcs_mask_tmp = squeeze(ir_mcs_mask(i-mo:i+mo,j-mo:j+mo,hr));
                      ir_nomcs_mask_tmp = squeeze(ir_nomcs_mask(i-mo:i+mo,j-mo:j+mo,hr));
                      pr_tmp = squeeze(pr(i-mo:i+mo,j-mo:j+mo));
                   end
            	   pr_tmp(pr_tmp<=0) = NaN;
	    	   m_pr = mean(pr_tmp(:),'omitnan');
            	   tmp = pr_tmp(ir_mcs_mask_tmp);
            	   m_pr_mcs = mean(tmp(:),'omitnan');
            	   tmp = pr_tmp(ir_nomcs_mask_tmp);
            	   m_pr_nonmcs = mean(tmp(:),'omitnan');
            	   mask_pr = pr_tmp>2; mask_dry = pr_tmp<=2;
            	   tmp = pr_tmp(logical(ir_nomcs_mask_tmp.*mask_pr));
            	   m_pr_nonmcs_pr2 = mean(tmp(:),'omitnan');
            	   tmp = pr_tmp(logical(ir_nomcs_mask_tmp.*mask_dry));
            	   m_pr_nonmcs_dry2 = mean(tmp(:),'omitnan');
            	   mask_pr = pr_tmp>1; mask_dry = pr_tmp<=1;
            	   tmp = pr_tmp(logical(ir_nomcs_mask_tmp.*mask_pr));
            	   m_pr_nonmcs_pr1 = mean(tmp(:),'omitnan');
            	   tmp = pr_tmp(logical(ir_nomcs_mask_tmp.*mask_dry));
            	   m_pr_nonmcs_dry1 = mean(tmp(:),'omitnan');
            	   cell_pr(end+1,:) = {m_pr,m_pr_mcs,m_pr_nonmcs,m_pr_nonmcs_pr2,m_pr_nonmcs_dry2,m_pr_nonmcs_pr1,m_pr_nonmcs_dry1,hr};
            end
        end
    end
    save(['/neelin2020/ACRE/Processed/MCS_pr025_10x10rc_' yyyy mm dd '_every5_new.mat'],'cell_pr');
    clear cell_pr;
end
end
end

