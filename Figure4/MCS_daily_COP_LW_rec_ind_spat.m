%with zero rain pixels
clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

xdim=360; ydim=50; mo = 4; mo1 = (mo*2+1)*4;
blk = [4 4];
xdim_ori=1440; ydim_ori=200;
lon=(0.5:1:359.5)';
lat=(-24.5:1:24.5)';
lon_ori=(0.125:0.25:360-0.125)';
lat_ori=(-24.875:0.25:24.875)';
[X_ori,Y_ori] = meshgrid(lat_ori,lon_ori);

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
mask_w_mcs_02 = zeros(mo1,mo1,4);
mask_pr_mcs_02 = zeros(mo1,mo1,4);
mask_mcs_mcs_02 = zeros(mo1,mo1,4);
mask_nomcs_mcs_02 = zeros(mo1,mo1,4);
mask_lwcrf_mcs_02 = zeros(mo*2+1,mo*2+1,4);
mask_w_mcs_08 = zeros(mo1,mo1,4);
mask_pr_mcs_08 = zeros(mo1,mo1,4);
mask_mcs_mcs_08 = zeros(mo1,mo1,4);
mask_nomcs_mcs_08 = zeros(mo1,mo1,4);
mask_lwcrf_mcs_08 = zeros(mo*2+1,mo*2+1,4);
pr_spat_mcs_02 = zeros(mo1,mo1,4);
w_spat_mcs_02 = zeros(mo1,mo1,4);
mcs_spat_mcs_02 = zeros(mo1,mo1,4);
nomcs_spat_mcs_02 = zeros(mo1,mo1,4);
lwcrf_spat_mcs_02 = zeros(mo*2+1,mo*2+1,4);
pr_spat_mcs_08 = zeros(mo1,mo1,4);
w_spat_mcs_08 = zeros(mo1,mo1,4);
mcs_spat_mcs_08 = zeros(mo1,mo1,4);
nomcs_spat_mcs_08 = zeros(mo1,mo1,4);
lwcrf_spat_mcs_08 = zeros(mo*2+1,mo*2+1,4);
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
    load(fn_mcs);

    fn_CF1 = ['/neelin2020/ACRE/CERES/Adj_flux_clr/CERES_hourly_Adjclr_' yyyy mm dd '.mat'];
    fn_CF2 = ['/neelin2020/ACRE/CERES/Adj_flux_all/CERES_hourly_Adjall_' yyyy mm dd '.mat'];
    load(fn_CF1);
    load(fn_CF2);
    lw_down_toa_all = lw_down_toa_all(:,6:55,:);
    lw_up_toa_all = lw_up_toa_all(:,6:55,:);
    lw_down_sfc_all = lw_down_sfc_all(:,6:55,:);
    lw_up_sfc_all = lw_up_sfc_all(:,6:55,:);
    lw_down_toa_clr = lw_down_toa_clr(:,6:55,:);
    lw_up_toa_clr = lw_up_toa_clr(:,6:55,:);
    lw_down_sfc_clr = lw_down_sfc_clr(:,6:55,:);
    lw_up_sfc_clr = lw_up_sfc_clr(:,6:55,:);

    fn_vv = ['/neelin2020/ACRE/ERA5/ERA5_VV500_' yyyy mm dd '.nc'];
    v = ncread(fn_vv,'w');
    v(v<-30000)= NaN;
     
    for hr = 1:2:48
        % Set MCS with area smaller than 1x1deg (= 16) to zero
        ir_mcs_mask_nosmall = ir_mcs_mask(:,:,hr); 
        CC = bwconncomp(ir_mcs_mask_nosmall);
        numPixels = cellfun(@numel, CC.PixelIdxList);
        mcs_cc_idx = find(numPixels < 16); % Indices of connected components with area<1x1deg
        for mcs_idx = 1:length(mcs_cc_idx)
            ir_mcs_mask_nosmall(CC.PixelIdxList{mcs_cc_idx(mcs_idx)}) = 0;
        end %end-mcs_idx

        vv_ori = flip(squeeze(v(:,:,(hr+1)/2)),2);
        sz = size(vv_ori);
        vv = zeros(sz(1),sz(2));
        vv(1:sz(1)/2,:) = vv_ori((sz(1)/2+1):sz(1),:);
        vv((sz(1)/2+1):sz(1),:) = vv_ori(1:sz(1)/2,:);
        vv_2 = cat(1,vv(end-9:end,:),vv,vv(1:10,:));
        lon_vv = (-2.5:0.25:362.25)';
        lat_vv = (-31:0.25:31)';
        [X_vv,Y_vv] = meshgrid(lat_vv,lon_vv);
        vv_re = interp2(X_vv,Y_vv,double(vv_2),X_ori,Y_ori,'linear');

        fn_pr = ['/neelin2020/ACRE/IMERG/3B-HHR.MS.MRG.3IMERG.' yyyy mm dd '-' IMERG_hr((hr+1)/2,:) '.V06B.HDF5_re025.nc'];
        pr = ncread(fn_pr,'precipitationCal');
        pr(pr<-1000.) = NaN;
        pr = permute(pr,[2 1]);

        CC = bwconncomp(ir_mcs_mask_nosmall);
        s = regionprops(CC, {'area','centroid'});
        cents = zeros(numel(s),2);

        for i = 1:numel(s)
            cents(i,:) = s(i).Centroid;
            cents_area = s(i).Area;
            if cents_area < 16
                continue
            end
            [val,lon_c]=min(abs(lon-lon_ori(round(cents(i,2)))));
            [val,lat_c]=min(abs(lat-lat_ori(round(cents(i,1)))));

            if lat_c-mo < 1 || lat_c+mo > ydim
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
                ir_mcs_mask_tmp = [squeeze(ir_mcs_mask(lon_c1:xdim_ori,lat_c1:lat_c2,hr));squeeze(ir_mcs_mask(1:lon_c2,lat_c1:lat_c2,hr))];
                ir_nomcs_mask_tmp = [squeeze(ir_nomcs_mask(lon_c1:xdim_ori,lat_c1:lat_c2,hr));squeeze(ir_nomcs_mask(1:lon_c2,lat_c1:lat_c2,hr))];
                pr_tmp = [pr(lon_c1:xdim_ori,lat_c1:lat_c2);pr(1:lon_c2,lat_c1:lat_c2)];
                w_tmp = [squeeze(vv_re(lon_c1:xdim_ori,lat_c1:lat_c2));squeeze(vv_re(1:lon_c2,lat_c1:lat_c2))];
                all_lw_down_toa = [lw_down_toa_all((xdim+lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_down_toa_all(1:(lon_c+mo),lat_c-mo:lat_c+mo,(hr+1)/2)];
                all_lw_up_toa = [lw_up_toa_all((xdim+lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_up_toa_all(1:(lon_c+mo),lat_c-mo:lat_c+mo,(hr+1)/2)];
                all_lw_down_sfc = [lw_down_sfc_all((xdim+lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_down_sfc_all(1:(lon_c+mo),lat_c-mo:lat_c+mo,(hr+1)/2)];
                all_lw_up_sfc = [lw_up_sfc_all((xdim+lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_up_sfc_all(1:(lon_c+mo),lat_c-mo:lat_c+mo,(hr+1)/2)];
                clr_lw_down_toa = [lw_down_toa_clr((xdim+lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_down_toa_clr(1:(lon_c+mo),lat_c-mo:lat_c+mo,(hr+1)/2)];
                clr_lw_up_toa = [lw_up_toa_clr((xdim+lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_up_toa_clr(1:(lon_c+mo),lat_c-mo:lat_c+mo,(hr+1)/2)];
                clr_lw_down_sfc = [lw_down_sfc_clr((xdim+lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_down_sfc_clr(1:(lon_c+mo),lat_c-mo:lat_c+mo,(hr+1)/2)];
                clr_lw_up_sfc = [lw_up_sfc_clr((xdim+lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_up_sfc_clr(1:(lon_c+mo),lat_c-mo:lat_c+mo,(hr+1)/2)];
            elseif lat_c-mo>=1 && lat_c+mo<=ydim && lon_c+mo>xdim
                lon1 = lon(lon_c-mo)-0.375;
                lon2 = lon(lon_c+mo-xdim)+0.375;
                lat1 = lat(lat_c-mo)-0.375;
                lat2 = lat(lat_c+mo)+0.375;
                [val,lon_c1]=min(abs(lon_ori-lon1));
                [val,lon_c2]=min(abs(lon_ori-lon2));
                [val,lat_c1]=min(abs(lat_ori-lat1));
                [val,lat_c2]=min(abs(lat_ori-lat2));
                ir_mcs_mask_tmp = [squeeze(ir_mcs_mask(lon_c1:xdim_ori,lat_c1:lat_c2,hr));squeeze(ir_mcs_mask(1:lon_c2,lat_c1:lat_c2,hr))];
                ir_nomcs_mask_tmp = [squeeze(ir_nomcs_mask(lon_c1:xdim_ori,lat_c1:lat_c2,hr));squeeze(ir_nomcs_mask(1:lon_c2,lat_c1:lat_c2,hr))];
                pr_tmp = [pr(lon_c1:xdim_ori,lat_c1:lat_c2);pr(1:lon_c2,lat_c1:lat_c2)];
                w_tmp = [vv_re(lon_c1:xdim_ori,lat_c1:lat_c2);vv_re(1:lon_c2,lat_c1:lat_c2)];
                all_lw_down_toa = [lw_down_toa_all((lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_down_toa_all(1:(lon_c+mo-xdim),lat_c-mo:lat_c+mo,(hr+1)/2)];
                all_lw_up_toa = [lw_up_toa_all((lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_up_toa_all(1:(lon_c+mo-xdim),lat_c-mo:lat_c+mo,(hr+1)/2)];
                all_lw_down_sfc = [lw_down_sfc_all((lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_down_sfc_all(1:(lon_c+mo-xdim),lat_c-mo:lat_c+mo,(hr+1)/2)];
                all_lw_up_sfc = [lw_up_sfc_all((lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_up_sfc_all(1:(lon_c+mo-xdim),lat_c-mo:lat_c+mo,(hr+1)/2)];
                clr_lw_down_toa = [lw_down_toa_clr((lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_down_toa_clr(1:(lon_c+mo-xdim),lat_c-mo:lat_c+mo,(hr+1)/2)];
                clr_lw_up_toa = [lw_up_toa_clr((lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_up_toa_clr(1:(lon_c+mo-xdim),lat_c-mo:lat_c+mo,(hr+1)/2)];
                clr_lw_down_sfc = [lw_down_sfc_clr((lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_down_sfc_clr(1:(lon_c+mo-xdim),lat_c-mo:lat_c+mo,(hr+1)/2)];
                clr_lw_up_sfc = [lw_up_sfc_clr((lon_c-mo):xdim,lat_c-mo:lat_c+mo,(hr+1)/2);lw_up_sfc_clr(1:(lon_c+mo-xdim),lat_c-mo:lat_c+mo,(hr+1)/2)];
            else
                lon1 = lon(lon_c-mo)-0.375;
                lon2 = lon(lon_c+mo)+0.375;
                lat1 = lat(lat_c-mo)-0.375;
                lat2 = lat(lat_c+mo)+0.375;
                [val,lon_c1]=min(abs(lon_ori-lon1));
                [val,lon_c2]=min(abs(lon_ori-lon2));
                [val,lat_c1]=min(abs(lat_ori-lat1));
                [val,lat_c2]=min(abs(lat_ori-lat2));
                ir_mcs_mask_tmp = squeeze(ir_mcs_mask(lon_c1:lon_c2,lat_c1:lat_c2,hr));
                ir_nomcs_mask_tmp = squeeze(ir_nomcs_mask(lon_c1:lon_c2,lat_c1:lat_c2,hr));
                pr_tmp = pr(lon_c1:lon_c2,lat_c1:lat_c2);
                w_tmp = vv_re(lon_c1:lon_c2,lat_c1:lat_c2);
                all_lw_down_toa = lw_down_toa_all(lon_c-mo:lon_c+mo,lat_c-mo:lat_c+mo,(hr+1)/2);
                all_lw_up_toa = lw_up_toa_all(lon_c-mo:lon_c+mo,lat_c-mo:lat_c+mo,(hr+1)/2);
                all_lw_down_sfc = lw_down_sfc_all(lon_c-mo:lon_c+mo,lat_c-mo:lat_c+mo,(hr+1)/2);
                all_lw_up_sfc = lw_up_sfc_all(lon_c-mo:lon_c+mo,lat_c-mo:lat_c+mo,(hr+1)/2);
                clr_lw_down_toa = lw_down_toa_clr(lon_c-mo:lon_c+mo,lat_c-mo:lat_c+mo,(hr+1)/2);
                clr_lw_up_toa = lw_up_toa_clr(lon_c-mo:lon_c+mo,lat_c-mo:lat_c+mo,(hr+1)/2);
                clr_lw_down_sfc = lw_down_sfc_clr(lon_c-mo:lon_c+mo,lat_c-mo:lat_c+mo,(hr+1)/2);
                clr_lw_up_sfc = lw_up_sfc_clr(lon_c-mo:lon_c+mo,lat_c-mo:lat_c+mo,(hr+1)/2);
            end
            lw_toa_all = all_lw_down_toa - all_lw_up_toa;
            lw_sfc_all = all_lw_down_sfc - all_lw_up_sfc;
            lw_toa_clr = clr_lw_down_toa - clr_lw_up_toa;
            lw_sfc_clr = clr_lw_down_sfc - clr_lw_up_sfc;
            all_lw_crf = (lw_toa_all-lw_toa_clr) - (lw_sfc_all-lw_sfc_clr);

            pr(pr<=0) = NaN;
            m_pr_mcs = mean(pr(CC.PixelIdxList{i}),'omitnan');
            
            tmp = pr_tmp(ir_mcs_mask_tmp);
            tmp(tmp<=0) = NaN;
            f_pr_mcs = sum(tmp(:),'omitnan')/sum(pr_tmp(:),'omitnan');

            if f_pr_mcs < 0.5193
                if m_pr_mcs > 0 && m_pr_mcs <= 0.475179841279616
                    mask_w_mcs_02(:,:,1) = mask_w_mcs_02(:,:,1) + ~isnan(w_tmp);
                    mask_pr_mcs_02(:,:,1) = mask_pr_mcs_02(:,:,1) + ~isnan(pr_tmp);
                    mask_lwcrf_mcs_02(:,:,1) = mask_lwcrf_mcs_02(:,:,1) + ~isnan(all_lw_crf);
                    mask_mcs_mcs_02(:,:,1) = mask_mcs_mcs_02(:,:,1) + ~isnan(ir_mcs_mask_tmp);
                    mask_nomcs_mcs_02(:,:,1) = mask_nomcs_mcs_02(:,:,1) + ~isnan(ir_nomcs_mask_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    pr_tmp_1 = pr_tmp; pr_tmp_1(isnan(pr_tmp_1)) = 0;
                    all_lw_crf_1 = all_lw_crf; all_lw_crf_1(isnan(all_lw_crf_1)) = 0;
                    ir_mcs_mask_tmp_1 = ir_mcs_mask_tmp; ir_mcs_mask_tmp_1(isnan(ir_mcs_mask_tmp_1)) = 0;
                    ir_nomcs_mask_tmp_1 = ir_nomcs_mask_tmp; ir_nomcs_mask_tmp_1(isnan(ir_nomcs_mask_tmp_1)) = 0;
                    w_spat_mcs_02(:,:,1) = w_spat_mcs_02(:,:,1) + w_tmp_1;
                    pr_spat_mcs_02(:,:,1) = pr_spat_mcs_02(:,:,1) + pr_tmp_1;
                    lwcrf_spat_mcs_02(:,:,1) = lwcrf_spat_mcs_02(:,:,1) + all_lw_crf_1;
                    mcs_spat_mcs_02(:,:,1) = mcs_spat_mcs_02(:,:,1) + ir_mcs_mask_tmp_1;
                    nomcs_spat_mcs_02(:,:,1) = nomcs_spat_mcs_02(:,:,1) + ir_nomcs_mask_tmp_1;
                elseif m_pr_mcs > 0.475179841279616 && m_pr_mcs <= 1.10487983656506
                    mask_w_mcs_02(:,:,2) = mask_w_mcs_02(:,:,2) + ~isnan(w_tmp);
                    mask_pr_mcs_02(:,:,2) = mask_pr_mcs_02(:,:,2) + ~isnan(pr_tmp);
                    mask_lwcrf_mcs_02(:,:,2) = mask_lwcrf_mcs_02(:,:,2) + ~isnan(all_lw_crf);
                    mask_mcs_mcs_02(:,:,2) = mask_mcs_mcs_02(:,:,2) + ~isnan(ir_mcs_mask_tmp);
                    mask_nomcs_mcs_02(:,:,2) = mask_nomcs_mcs_02(:,:,2) + ~isnan(ir_nomcs_mask_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    pr_tmp_1 = pr_tmp; pr_tmp_1(isnan(pr_tmp_1)) = 0;
                    all_lw_crf_1 = all_lw_crf; all_lw_crf_1(isnan(all_lw_crf_1)) = 0;
                    ir_mcs_mask_tmp_1 = ir_mcs_mask_tmp; ir_mcs_mask_tmp_1(isnan(ir_mcs_mask_tmp_1)) = 0;
                    ir_nomcs_mask_tmp_1 = ir_nomcs_mask_tmp; ir_nomcs_mask_tmp_1(isnan(ir_nomcs_mask_tmp_1)) = 0;
                    w_spat_mcs_02(:,:,2) = w_spat_mcs_02(:,:,2) + w_tmp_1;
                    pr_spat_mcs_02(:,:,2) = pr_spat_mcs_02(:,:,2) + pr_tmp_1;
                    lwcrf_spat_mcs_02(:,:,2) = lwcrf_spat_mcs_02(:,:,2) + all_lw_crf_1;
                    mcs_spat_mcs_02(:,:,2) = mcs_spat_mcs_02(:,:,2) + ir_mcs_mask_tmp_1;
                    nomcs_spat_mcs_02(:,:,2) = nomcs_spat_mcs_02(:,:,2) + ir_nomcs_mask_tmp_1;
                elseif m_pr_mcs > 1.10487983656506 && m_pr_mcs <= 1.98303422394794
                    mask_w_mcs_02(:,:,3) = mask_w_mcs_02(:,:,3) + ~isnan(w_tmp);
                    mask_pr_mcs_02(:,:,3) = mask_pr_mcs_02(:,:,3) + ~isnan(pr_tmp);
                    mask_lwcrf_mcs_02(:,:,3) = mask_lwcrf_mcs_02(:,:,3) + ~isnan(all_lw_crf);
                    mask_mcs_mcs_02(:,:,3) = mask_mcs_mcs_02(:,:,3) + ~isnan(ir_mcs_mask_tmp);
                    mask_nomcs_mcs_02(:,:,3) = mask_nomcs_mcs_02(:,:,3) + ~isnan(ir_nomcs_mask_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    pr_tmp_1 = pr_tmp; pr_tmp_1(isnan(pr_tmp_1)) = 0;
                    all_lw_crf_1 = all_lw_crf; all_lw_crf_1(isnan(all_lw_crf_1)) = 0;
                    ir_mcs_mask_tmp_1 = ir_mcs_mask_tmp; ir_mcs_mask_tmp_1(isnan(ir_mcs_mask_tmp_1)) = 0;
                    ir_nomcs_mask_tmp_1 = ir_nomcs_mask_tmp; ir_nomcs_mask_tmp_1(isnan(ir_nomcs_mask_tmp_1)) = 0;
                    w_spat_mcs_02(:,:,3) = w_spat_mcs_02(:,:,3) + w_tmp_1;
                    pr_spat_mcs_02(:,:,3) = pr_spat_mcs_02(:,:,3) + pr_tmp_1;
                    lwcrf_spat_mcs_02(:,:,3) = lwcrf_spat_mcs_02(:,:,3) + all_lw_crf_1;
                    mcs_spat_mcs_02(:,:,3) = mcs_spat_mcs_02(:,:,3) + ir_mcs_mask_tmp_1;
                    nomcs_spat_mcs_02(:,:,3) = nomcs_spat_mcs_02(:,:,3) + ir_nomcs_mask_tmp_1;
                elseif m_pr_mcs > 1.98303422394794
                    mask_w_mcs_02(:,:,4) = mask_w_mcs_02(:,:,4) + ~isnan(w_tmp);
                    mask_pr_mcs_02(:,:,4) = mask_pr_mcs_02(:,:,4) + ~isnan(pr_tmp);
                    mask_lwcrf_mcs_02(:,:,4) = mask_lwcrf_mcs_02(:,:,4) + ~isnan(all_lw_crf);
                    mask_mcs_mcs_02(:,:,4) = mask_mcs_mcs_02(:,:,4) + ~isnan(ir_mcs_mask_tmp);
                    mask_nomcs_mcs_02(:,:,4) = mask_nomcs_mcs_02(:,:,4) + ~isnan(ir_nomcs_mask_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    pr_tmp_1 = pr_tmp; pr_tmp_1(isnan(pr_tmp_1)) = 0;
                    all_lw_crf_1 = all_lw_crf; all_lw_crf_1(isnan(all_lw_crf_1)) = 0;
                    ir_mcs_mask_tmp_1 = ir_mcs_mask_tmp; ir_mcs_mask_tmp_1(isnan(ir_mcs_mask_tmp_1)) = 0;
                    ir_nomcs_mask_tmp_1 = ir_nomcs_mask_tmp; ir_nomcs_mask_tmp_1(isnan(ir_nomcs_mask_tmp_1)) = 0;
                    w_spat_mcs_02(:,:,4) = w_spat_mcs_02(:,:,4) + w_tmp_1;
                    pr_spat_mcs_02(:,:,4) = pr_spat_mcs_02(:,:,4) + pr_tmp_1;
                    lwcrf_spat_mcs_02(:,:,4) = lwcrf_spat_mcs_02(:,:,4) + all_lw_crf_1;
                    mcs_spat_mcs_02(:,:,4) = mcs_spat_mcs_02(:,:,4) + ir_mcs_mask_tmp_1;
                    nomcs_spat_mcs_02(:,:,4) = nomcs_spat_mcs_02(:,:,4) + ir_nomcs_mask_tmp_1;
                end
            elseif f_pr_mcs > 0.7866
                if m_pr_mcs > 0 && m_pr_mcs <= 0.475179841279616
                    mask_w_mcs_08(:,:,1) = mask_w_mcs_08(:,:,1) + ~isnan(w_tmp);
                    mask_pr_mcs_08(:,:,1) = mask_pr_mcs_08(:,:,1) + ~isnan(pr_tmp);
                    mask_lwcrf_mcs_08(:,:,1) = mask_lwcrf_mcs_08(:,:,1) + ~isnan(all_lw_crf);
                    mask_mcs_mcs_08(:,:,1) = mask_mcs_mcs_08(:,:,1) + ~isnan(ir_mcs_mask_tmp);
                    mask_nomcs_mcs_08(:,:,1) = mask_nomcs_mcs_08(:,:,1) + ~isnan(ir_nomcs_mask_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    pr_tmp_1 = pr_tmp; pr_tmp_1(isnan(pr_tmp_1)) = 0;
                    all_lw_crf_1 = all_lw_crf; all_lw_crf_1(isnan(all_lw_crf_1)) = 0;
                    ir_mcs_mask_tmp_1 = ir_mcs_mask_tmp; ir_mcs_mask_tmp_1(isnan(ir_mcs_mask_tmp_1)) = 0;
                    ir_nomcs_mask_tmp_1 = ir_nomcs_mask_tmp; ir_nomcs_mask_tmp_1(isnan(ir_nomcs_mask_tmp_1)) = 0;
                    w_spat_mcs_08(:,:,1) = w_spat_mcs_08(:,:,1) + w_tmp_1;
                    pr_spat_mcs_08(:,:,1) = pr_spat_mcs_08(:,:,1) + pr_tmp_1;
                    lwcrf_spat_mcs_08(:,:,1) = lwcrf_spat_mcs_08(:,:,1) + all_lw_crf_1;
                    mcs_spat_mcs_08(:,:,1) = mcs_spat_mcs_08(:,:,1) + ir_mcs_mask_tmp_1;
                    nomcs_spat_mcs_08(:,:,1) = nomcs_spat_mcs_08(:,:,1) + ir_nomcs_mask_tmp_1;
                elseif m_pr_mcs > 0.475179841279616 && m_pr_mcs <= 1.10487983656506
                    mask_w_mcs_08(:,:,2) = mask_w_mcs_08(:,:,2) + ~isnan(w_tmp);
                    mask_pr_mcs_08(:,:,2) = mask_pr_mcs_08(:,:,2) + ~isnan(pr_tmp);
                    mask_lwcrf_mcs_08(:,:,2) = mask_lwcrf_mcs_08(:,:,2) + ~isnan(all_lw_crf);
                    mask_mcs_mcs_08(:,:,2) = mask_mcs_mcs_08(:,:,2) + ~isnan(ir_mcs_mask_tmp);
                    mask_nomcs_mcs_08(:,:,2) = mask_nomcs_mcs_08(:,:,2) + ~isnan(ir_nomcs_mask_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    pr_tmp_1 = pr_tmp; pr_tmp_1(isnan(pr_tmp_1)) = 0;
                    all_lw_crf_1 = all_lw_crf; all_lw_crf_1(isnan(all_lw_crf_1)) = 0;
                    ir_mcs_mask_tmp_1 = ir_mcs_mask_tmp; ir_mcs_mask_tmp_1(isnan(ir_mcs_mask_tmp_1)) = 0;
                    ir_nomcs_mask_tmp_1 = ir_nomcs_mask_tmp; ir_nomcs_mask_tmp_1(isnan(ir_nomcs_mask_tmp_1)) = 0;
                    w_spat_mcs_08(:,:,2) = w_spat_mcs_08(:,:,2) + w_tmp_1;
                    pr_spat_mcs_08(:,:,2) = pr_spat_mcs_08(:,:,2) + pr_tmp_1;
                    lwcrf_spat_mcs_08(:,:,2) = lwcrf_spat_mcs_08(:,:,2) + all_lw_crf_1;
                    mcs_spat_mcs_08(:,:,2) = mcs_spat_mcs_08(:,:,2) + ir_mcs_mask_tmp_1;
                    nomcs_spat_mcs_08(:,:,2) = nomcs_spat_mcs_08(:,:,2) + ir_nomcs_mask_tmp_1;
                elseif m_pr_mcs > 1.10487983656506 && m_pr_mcs <= 1.98303422394794
                    mask_w_mcs_08(:,:,3) = mask_w_mcs_08(:,:,3) + ~isnan(w_tmp);
                    mask_pr_mcs_08(:,:,3) = mask_pr_mcs_08(:,:,3) + ~isnan(pr_tmp);
                    mask_lwcrf_mcs_08(:,:,3) = mask_lwcrf_mcs_08(:,:,3) + ~isnan(all_lw_crf);
                    mask_mcs_mcs_08(:,:,3) = mask_mcs_mcs_08(:,:,3) + ~isnan(ir_mcs_mask_tmp);
                    mask_nomcs_mcs_08(:,:,3) = mask_nomcs_mcs_08(:,:,3) + ~isnan(ir_nomcs_mask_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    pr_tmp_1 = pr_tmp; pr_tmp_1(isnan(pr_tmp_1)) = 0;
                    all_lw_crf_1 = all_lw_crf; all_lw_crf_1(isnan(all_lw_crf_1)) = 0;
                    ir_mcs_mask_tmp_1 = ir_mcs_mask_tmp; ir_mcs_mask_tmp_1(isnan(ir_mcs_mask_tmp_1)) = 0;
                    ir_nomcs_mask_tmp_1 = ir_nomcs_mask_tmp; ir_nomcs_mask_tmp_1(isnan(ir_nomcs_mask_tmp_1)) = 0;
                    w_spat_mcs_08(:,:,3) = w_spat_mcs_08(:,:,3) + w_tmp_1;
                    pr_spat_mcs_08(:,:,3) = pr_spat_mcs_08(:,:,3) + pr_tmp_1;
                    lwcrf_spat_mcs_08(:,:,3) = lwcrf_spat_mcs_08(:,:,3) + all_lw_crf_1;
                    mcs_spat_mcs_08(:,:,3) = mcs_spat_mcs_08(:,:,3) + ir_mcs_mask_tmp_1;
                    nomcs_spat_mcs_08(:,:,3) = nomcs_spat_mcs_08(:,:,3) + ir_nomcs_mask_tmp_1;
                elseif m_pr_mcs > 1.98303422394794
                    mask_w_mcs_08(:,:,4) = mask_w_mcs_08(:,:,4) + ~isnan(w_tmp);
                    mask_pr_mcs_08(:,:,4) = mask_pr_mcs_08(:,:,4) + ~isnan(pr_tmp);
                    mask_lwcrf_mcs_08(:,:,4) = mask_lwcrf_mcs_08(:,:,4) + ~isnan(all_lw_crf);
                    mask_mcs_mcs_08(:,:,4) = mask_mcs_mcs_08(:,:,4) + ~isnan(ir_mcs_mask_tmp);
                    mask_nomcs_mcs_08(:,:,4) = mask_nomcs_mcs_08(:,:,4) + ~isnan(ir_nomcs_mask_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    pr_tmp_1 = pr_tmp; pr_tmp_1(isnan(pr_tmp_1)) = 0;
                    all_lw_crf_1 = all_lw_crf; all_lw_crf_1(isnan(all_lw_crf_1)) = 0;
                    ir_mcs_mask_tmp_1 = ir_mcs_mask_tmp; ir_mcs_mask_tmp_1(isnan(ir_mcs_mask_tmp_1)) = 0;
                    ir_nomcs_mask_tmp_1 = ir_nomcs_mask_tmp; ir_nomcs_mask_tmp_1(isnan(ir_nomcs_mask_tmp_1)) = 0;
                    w_spat_mcs_08(:,:,4) = w_spat_mcs_08(:,:,4) + w_tmp_1;
                    pr_spat_mcs_08(:,:,4) = pr_spat_mcs_08(:,:,4) + pr_tmp_1;
                    lwcrf_spat_mcs_08(:,:,4) = lwcrf_spat_mcs_08(:,:,4) + all_lw_crf_1;
                    mcs_spat_mcs_08(:,:,4) = mcs_spat_mcs_08(:,:,4) + ir_mcs_mask_tmp_1;
                    nomcs_spat_mcs_08(:,:,4) = nomcs_spat_mcs_08(:,:,4) + ir_nomcs_mask_tmp_1;
                end 
            end
        end
    end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/MCS_PRfracactual_lwcrf_spat_10x10_02_' yyyy '.mat'],'lwcrf_spat_mcs_02','mcs_spat_mcs_02','nomcs_spat_mcs_02','w_spat_mcs_02','pr_spat_mcs_02','mask_w_mcs_02','mask_pr_mcs_02','mask_lwcrf_mcs_02','mask_mcs_mcs_02','mask_nomcs_mcs_02');
save(['/neelin2020/ACRE/Processed_ACRE_revised/MCS_PRfracactual_lwcrf_spat_10x10_08_' yyyy '.mat'],'lwcrf_spat_mcs_08','mcs_spat_mcs_08','nomcs_spat_mcs_08','w_spat_mcs_08','pr_spat_mcs_08','mask_w_mcs_08','mask_pr_mcs_08','mask_lwcrf_mcs_08','mask_mcs_mcs_08','mask_nomcs_mcs_08');
end
