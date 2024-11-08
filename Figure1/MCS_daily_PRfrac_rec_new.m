%with zero rain pixels
clear all;
addpath('../Shared');
addpath('../Project4');

xdim=360; ydim=50; mo = 4; mo1 = (mo*2+1)*4;
xdim_ori=1440; ydim_ori=200;
lon=(0.5:1:359.5)';
lat=(-24.5:1:24.5)';
lon_ori=(0.125:0.25:360-0.125)';
lat_ori=(-24.875:0.25:24.875)';

IMERG_hr = ["S000000-E002959.0000" "S010000-E012959.0060" "S020000-E022959.0120" ...
            "S030000-E032959.0180" "S040000-E042959.0240" "S050000-E052959.0300" ...
            "S060000-E062959.0360" "S070000-E072959.0420" "S080000-E082959.0480" ...
            "S090000-E092959.0540" "S100000-E102959.0600" "S110000-E112959.0660" ...
            "S120000-E122959.0720" "S130000-E132959.0780" "S140000-E142959.0840" ...
            "S150000-E152959.0900" "S160000-E162959.0960" "S170000-E172959.1020" ...
            "S180000-E182959.1080" "S190000-E192959.1140" "S200000-E202959.1200" ...
            "S210000-E212959.1260" "S220000-E222959.1320" "S230000-E232959.1380"];

%%---------------------------------------
for yy = 2001:2019
for mon = 1:12
startdate = datenum(yy,mon,01);
enddate = datenum(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    cell_prfrac = {};
    yyyy = datestr(date,'yyyy');
    mm = datestr(date,'mm');
    dd = datestr(date,'dd');
    fn_mcs = ['/bsoden/ndai/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
    load(fn_mcs);
    for hr = 1:2:48
        fn_pr = ['/bsoden/ndai/IMERG/3B-HHR.MS.MRG.3IMERG.' yyyy mm dd '-' char(IMERG_hr((hr+1)/2)) '.V06B.HDF5_re025.nc'];
        pr = ncread(fn_pr,'precipitationCal'); 
        pr(pr<-1000.) = NaN;
        pr = permute(pr,[2 1]);
        CC = bwconncomp(ir_mcs_mask(:,:,hr));
        s = regionprops(CC, {'area','centroid'});
        cents = zeros(numel(s),2);
        cents_area = zeros(numel(s),1);
        for i = 1:numel(s)
            cents(i,:) = s(i).Centroid;
            cents_area(i,:) = s(i).Area;
            [val,lon_c]=min(abs(lon-lon_ori(round(cents(i,2)))));
            [val,lat_c]=min(abs(lat-lat_ori(round(cents(i,1)))));

            if lat_c-mo < 1 || lat_c+mo>ydim
                continue
            elseif lat_c-mo>=1 && lat_c+mo<=ydim && lon_c-mo<1
                lon1 = lon(lon_c-mo+xdim)-0.375;
                lon2 = lon(lon_c+mo)+0.375;
                lat1 = lat(lat_c-mo)-0.375;
                lat2 = lat(lat_c+mo)+0.375;
                [val,lon_c1]=min(abs(lon_ori-lon1));
                [val,lon_c2]=min(abs(lon_ori-lon2));
                [val,lat_c1]=min(abs(lat_ori-lat1));
                [val,lat_c2]=min(abs(lat_ori-lat2));
                ir_mcs_mask_tmp = [ir_mcs_mask(lon_c1:xdim_ori,lat_c1:lat_c2,hr);ir_mcs_mask(1:lon_c2,lat_c1:lat_c2,hr)];
                ir_nomcs_mask_tmp = [ir_nomcs_mask(lon_c1:xdim_ori,lat_c1:lat_c2,hr);ir_nomcs_mask(1:lon_c2,lat_c1:lat_c2,hr)];
                pr_tmp = [pr(lon_c1:xdim_ori,lat_c1:lat_c2);pr(1:lon_c2,lat_c1:lat_c2)];
            elseif lat_c-mo>=1 && lat_c+mo<=ydim && lon_c+mo>xdim
                lon1 = lon(lon_c-mo)-0.375;
                lon2 = lon(lon_c+mo-xdim)+0.375;
                lat1 = lat(lat_c-mo)-0.375;
                lat2 = lat(lat_c+mo)+0.375;
                [val,lon_c1]=min(abs(lon_ori-lon1));
                [val,lon_c2]=min(abs(lon_ori-lon2));
                [val,lat_c1]=min(abs(lat_ori-lat1));
                [val,lat_c2]=min(abs(lat_ori-lat2));
                ir_mcs_mask_tmp = [ir_mcs_mask(lon_c1:xdim_ori,lat_c1:lat_c2,hr);ir_mcs_mask(1:lon_c2,lat_c1:lat_c2,hr)];
                ir_nomcs_mask_tmp = [ir_nomcs_mask(lon_c1:xdim_ori,lat_c1:lat_c2,hr);ir_nomcs_mask(1:lon_c2,lat_c1:lat_c2,hr)];
                pr_tmp = [pr(lon_c1:xdim_ori,lat_c1:lat_c2);pr(1:lon_c2,lat_c1:lat_c2)];
            else
                lon1 = lon(lon_c-mo)-0.375;
                lon2 = lon(lon_c+mo)+0.375;
                lat1 = lat(lat_c-mo)-0.375;
                lat2 = lat(lat_c+mo)+0.375;
                [val,lon_c1]=min(abs(lon_ori-lon1));
                [val,lon_c2]=min(abs(lon_ori-lon2));
                [val,lat_c1]=min(abs(lat_ori-lat1));
                [val,lat_c2]=min(abs(lat_ori-lat2));
                ir_mcs_mask_tmp = ir_mcs_mask(lon_c1:lon_c2,lat_c1:lat_c2,hr);
                ir_nomcs_mask_tmp = ir_nomcs_mask(lon_c1:lon_c2,lat_c1:lat_c2,hr);
                pr_tmp = pr(lon_c1:lon_c2,lat_c1:lat_c2);
            end
            f_pr = numel(find(pr_tmp>0))/numel(pr_tmp);
            f_pr_mcs = numel(find(pr_tmp(ir_mcs_mask_tmp)>0))/numel(pr_tmp);
            f_pr_nonmcs = numel(find(pr_tmp(ir_nomcs_mask_tmp)>0))/numel(pr_tmp);
            mask_pr = pr_tmp>2; mask_dry = pr_tmp<=2;
            f_pr_nonmcs_pr2 = numel(find(pr_tmp(logical(ir_nomcs_mask_tmp.*mask_pr))>0))/numel(pr_tmp);
            f_pr_nonmcs_dry2 = numel(find(pr_tmp(logical(ir_nomcs_mask_tmp.*mask_dry))>0))/numel(pr_tmp);
            mask_pr = pr_tmp>1; mask_dry = pr_tmp<=1;
            f_pr_nonmcs_pr1 = numel(find(pr_tmp(logical(ir_nomcs_mask_tmp.*mask_pr))>0))/numel(pr_tmp);
            f_pr_nonmcs_dry1 = numel(find(pr_tmp(logical(ir_nomcs_mask_tmp.*mask_dry))>0))/numel(pr_tmp);
            cell_prfrac(end+1,:) = {f_pr,f_pr_mcs,f_pr_nonmcs,f_pr_nonmcs_pr2,f_pr_nonmcs_dry2,f_pr_nonmcs_pr1,f_pr_nonmcs_dry1,hr};
        end
    end
    save(['/bsoden/ndai/Processed/MCS_prfrac_10x10rc_' yyyy mm dd '_new.mat'],'cell_prfrac');
    clear cell_prfrac;
end
end
end

