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
[X_ori,Y_ori] = meshgrid(lat_ori,lon_ori);

IMERG_hr = ["S000000-E002959.0000" "S010000-E012959.0060" "S020000-E022959.0120" ...
            "S030000-E032959.0180" "S040000-E042959.0240" "S050000-E052959.0300" ...
            "S060000-E062959.0360" "S070000-E072959.0420" "S080000-E082959.0480" ...
            "S090000-E092959.0540" "S100000-E102959.0600" "S110000-E112959.0660" ...
            "S120000-E122959.0720" "S130000-E132959.0780" "S140000-E142959.0840" ...
            "S150000-E152959.0900" "S160000-E162959.0960" "S170000-E172959.1020" ...
            "S180000-E182959.1080" "S190000-E192959.1140" "S200000-E202959.1200" ...
            "S210000-E212959.1260" "S220000-E222959.1320" "S230000-E232959.1380"];

%%---------------------------------------
for yy = 2015:2017
for mon = 1:12
startdate = datenum(yy,mon,01);
enddate = datenum(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    cell_mse = {};
    yyyy = datestr(date,'yyyy');
    mm = datestr(date,'mm');
    dd = datestr(date,'dd');
    fn_mcs = ['/bsoden/ndai/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
    load(fn_mcs);
    fn_mse = ['/bsoden/ndai/ERA5/CWV/ERA5_mse_' yyyy mm dd '.nc'];
    mse = ncread(fn_mse,'p62.162');
    mse(mse<-30000)= NaN;
    mse = flip(mse,2);
    sz = size(mse);
    mse_new = zeros(sz(1),sz(2),sz(3));
    mse_new(1:sz(1)/2,:,:) = mse((sz(1)/2+1):sz(1),:,:);
    mse_new((sz(1)/2+1):sz(1),:,:) = mse(1:sz(1)/2,:,:);
    mse_2 = cat(1,mse_new(end-9:end,:,:),mse_new,mse_new(1:10,:,:));
    lon_vv = (-2.5:0.25:362.25)';
    lat_vv = (-31:0.25:31)';
    [X_vv,Y_vv] = meshgrid(lat_vv,lon_vv);
    mse_re = zeros(xdim_ori,ydim_ori,24);
    for i = 1:24
        mse_re(:,:,i) = interp2(X_vv,Y_vv,double(mse_2(:,:,i)),X_ori,Y_ori,'linear');
    end
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
                mse_tmp = [mse_re(lon_c1:xdim_ori,lat_c1:lat_c2,(hr+1)/2);mse_re(1:lon_c2,lat_c1:lat_c2,(hr+1)/2)];
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
                mse_tmp = [mse_re(lon_c1:xdim_ori,lat_c1:lat_c2,(hr+1)/2);mse_re(1:lon_c2,lat_c1:lat_c2,(hr+1)/2)];
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
                mse_tmp = mse_re(lon_c1:lon_c2,lat_c1:lat_c2,(hr+1)/2);
            end
            s_mse = std(mse_tmp(:),'omitnan');
            m_mse = mean(mse_tmp(:),'omitnan');
            tmp = mse_tmp(ir_mcs_mask_tmp);
            m_mse_mcs = mean(tmp(:),'omitnan');
            tmp = mse_tmp(ir_nomcs_mask_tmp);
            m_mse_nonmcs = mean(tmp(:),'omitnan');
            mask_pr = pr_tmp>2; mask_dry = pr_tmp<=2;
            tmp = mse_tmp(logical(ir_nomcs_mask_tmp.*mask_pr));
            m_mse_nonmcs_pr2 = mean(tmp(:),'omitnan');
            tmp = mse_tmp(logical(ir_nomcs_mask_tmp.*mask_dry));
            m_mse_nonmcs_dry2 = mean(tmp(:),'omitnan');
            mask_pr = pr_tmp>1; mask_dry = pr_tmp<=1;
            tmp = mse_tmp(logical(ir_nomcs_mask_tmp.*mask_pr));
            m_mse_nonmcs_pr1 = mean(tmp(:),'omitnan');
            tmp = mse_tmp(logical(ir_nomcs_mask_tmp.*mask_dry));
            m_mse_nonmcs_dry1 = mean(tmp(:),'omitnan');
            cell_mse(end+1,:) = {s_mse,m_mse,m_mse_mcs,m_mse_nonmcs,m_mse_nonmcs_pr2,m_mse_nonmcs_dry2,m_mse_nonmcs_pr1,m_mse_nonmcs_dry1,hr};
        end
    end
    save(['/bsoden/ndai/Processed/MCS_mse_10x10rc_' yyyy mm dd '_new.mat'],'cell_mse');
    clear cell_mse;
end
end
end

