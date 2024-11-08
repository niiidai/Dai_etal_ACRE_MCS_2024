%with zero rain pixels
clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');

xdim=360; ydim=50; mo = 4; blk = [4 4];
xdim_ori=1440; ydim_ori=200;
lon=(0.5:1:359.5)';
lat=(-24.5:1:24.5)';
lon_ori=(0.125:0.25:360-0.125)';
lat_ori=(-24.875:0.25:24.875)';
[X_ori,Y_ori] = meshgrid(lat_ori,lon_ori); 
[X,Y] = meshgrid(lat,lon); 

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
    disp(date)
    cell_vv = {};
    for hr = 1:2:48
        if hr < 25
           ME = [];
            yyyy = num2str(year(date+1), '%04d');
            mm = num2str(month(date+1), '%02d');
            dd = num2str(day(date+1), '%02d');
           hr2 = 48-(12-((hr+1)/2-1))*2+1;
        try
           fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat'];
           load(fn_mcs);
           % Set MCS with area smaller than 1x1deg (= 16) to zero
           ir_mcs_mask_nosmall = ir_mcs_mask(:,:,hr2); 
           CC = bwconncomp(ir_mcs_mask_nosmall);
           numPixels = cellfun(@numel, CC.PixelIdxList);
           mcs_cc_idx = find(numPixels < 16); % Indices of connected components with area<1x1deg
           for mcs_idx = 1:length(mcs_cc_idx)
               ir_mcs_mask_nosmall(CC.PixelIdxList{mcs_cc_idx(mcs_idx)}) = 0;
           end %end-mcs_idx

           % Set Non-MCS with area smaller than 1x1deg (= 16) to zero
           ir_nomcs_mask_nosmall = ir_nomcs_mask(:,:,hr2); 
           CC = bwconncomp(ir_nomcs_mask_nosmall);
           numPixels = cellfun(@numel, CC.PixelIdxList);
           nomcs_cc_idx = find(numPixels < 16); % Indices of connected components with area<1x1deg
           for nomcs_idx = 1:length(nomcs_cc_idx)
               ir_nomcs_mask_nosmall(CC.PixelIdxList{nomcs_cc_idx(nomcs_idx)}) = 0;
           end %end-nomcs_idx

           fn_vv = ['/neelin2020/ACRE/ERA5/ERA5_VV500_' yyyy mm dd '.nc'];
           v = ncread(fn_vv,'w');
           v(v<-30000)= NaN;
           vv_ori = flip(squeeze(v(:,:,(hr2+1)/2)),2);
           sz = size(vv_ori);
           vv = zeros(sz(1),sz(2));
           vv(1:sz(1)/2,:) = vv_ori((sz(1)/2+1):sz(1),:);
           vv((sz(1)/2+1):sz(1),:) = vv_ori(1:sz(1)/2,:);
           vv_2 = cat(1,vv(end-9:end,:),vv,vv(1:10,:));
           lon_vv = (-2.5:0.25:362.25)';
           lat_vv = (-31:0.25:31)';
           [X_vv,Y_vv] = meshgrid(lat_vv,lon_vv);
           vv_re = interp2(X_vv,Y_vv,double(vv_2),X_ori,Y_ori,'linear');
           fn_pr = ['/neelin2020/ACRE/IMERG/3B-HHR.MS.MRG.3IMERG.' yyyy mm dd '-' IMERG_hr((hr2+1)/2,:) '.V06B.HDF5_re025.nc'];
           pr = ncread(fn_pr,'precipitationCal');
           pr(pr<-1000.) = NaN;
           pr = permute(pr,[2 1]);
           ir_mcs_mask_new = squeeze(ir_mcs_mask_nosmall); 
           ir_nomcs_mask_new = squeeze(ir_nomcs_mask_nosmall); 
        catch ME
           fprintf('WEBREAD without success: %s\n', ME.message);
        end
        if ~isempty(ME)
           cell_vv(end+1,:) = {NaN,NaN,NaN,NaN,NaN,NaN,hr}; 
           continue
        end
        else
           hr2 = hr -24;
           yyyy = num2str(year(date), '%04d');
           mm = num2str(month(date), '%02d');
           dd = num2str(day(date), '%02d');
           fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat'];
           load(fn_mcs);
            % Set MCS with area smaller than 1x1deg (= 16) to zero
            ir_mcs_mask_nosmall = ir_mcs_mask(:,:,hr2); 
            CC = bwconncomp(ir_mcs_mask_nosmall);
            numPixels = cellfun(@numel, CC.PixelIdxList);
            mcs_cc_idx = find(numPixels < 16); % Indices of connected components with area<1x1deg
            for mcs_idx = 1:length(mcs_cc_idx)
                ir_mcs_mask_nosmall(CC.PixelIdxList{mcs_cc_idx(mcs_idx)}) = 0;
            end %end-mcs_idx

            % Set Non-MCS with area smaller than 1x1deg (= 16) to zero
            ir_nomcs_mask_nosmall = ir_nomcs_mask(:,:,hr2); 
            CC = bwconncomp(ir_nomcs_mask_nosmall);
            numPixels = cellfun(@numel, CC.PixelIdxList);
            nomcs_cc_idx = find(numPixels < 16); % Indices of connected components with area<1x1deg
            for nomcs_idx = 1:length(nomcs_cc_idx)
                ir_nomcs_mask_nosmall(CC.PixelIdxList{nomcs_cc_idx(nomcs_idx)}) = 0;
            end %end-nomcs_idx

           fn_vv = ['/neelin2020/ACRE/ERA5/ERA5_VV500_' yyyy mm dd '.nc'];
           v = ncread(fn_vv,'w');
           v(v<-30000)= NaN;
           vv_ori = flip(squeeze(v(:,:,(hr2+1)/2)),2);
           sz = size(vv_ori);
           vv = zeros(sz(1),sz(2));
           vv(1:sz(1)/2,:) = vv_ori((sz(1)/2+1):sz(1),:);
           vv((sz(1)/2+1):sz(1),:) = vv_ori(1:sz(1)/2,:);
           vv_2 = cat(1,vv(end-9:end,:),vv,vv(1:10,:));
           lon_vv = (-2.5:0.25:362.25)';
           lat_vv = (-31:0.25:31)';
           [X_vv,Y_vv] = meshgrid(lat_vv,lon_vv);
           vv_re = interp2(X_vv,Y_vv,double(vv_2),X_ori,Y_ori,'linear');
           fn_pr = ['/neelin2020/ACRE/IMERG/3B-HHR.MS.MRG.3IMERG.' yyyy mm dd '-' IMERG_hr((hr2+1)/2,:) '.V06B.HDF5_re025.nc'];
           pr = ncread(fn_pr,'precipitationCal');
           pr(pr<-1000.) = NaN;
           pr = permute(pr,[2 1]);
           ir_mcs_mask_new = squeeze(ir_mcs_mask_nosmall); 
           ir_nomcs_mask_new = squeeze(ir_nomcs_mask_nosmall); 
        end
        yyyy = num2str(year(date), '%04d');
        mm = num2str(month(date), '%02d');
        dd = num2str(day(date), '%02d');
        fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat'];
        load(fn_mcs);
        % Set MCS with area smaller than 1x1deg (= 16) to zero
        ir_mcs_mask_nosmall = ir_mcs_mask(:,:,hr); 
        CC = bwconncomp(ir_mcs_mask_nosmall);
        numPixels = cellfun(@numel, CC.PixelIdxList);
        mcs_cc_idx = find(numPixels < 16); % Indices of connected components with area<1x1deg
        for mcs_idx = 1:length(mcs_cc_idx)
            ir_mcs_mask_nosmall(CC.PixelIdxList{mcs_cc_idx(mcs_idx)}) = 0;
        end %end-mcs_idx

        % Set Non-MCS with area smaller than 1x1deg (= 16) to zero
        ir_nomcs_mask_nosmall = ir_nomcs_mask(:,:,hr); 
        CC = bwconncomp(ir_nomcs_mask_nosmall);
        numPixels = cellfun(@numel, CC.PixelIdxList);
        nomcs_cc_idx = find(numPixels < 16); % Indices of connected components with area<1x1deg
        for nomcs_idx = 1:length(nomcs_cc_idx)
            ir_nomcs_mask_nosmall(CC.PixelIdxList{nomcs_cc_idx(nomcs_idx)}) = 0;
        end %end-nomcs_idx

        CC = bwconncomp(squeeze(ir_mcs_mask_nosmall));
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
                ir_mcs_mask_tmp = [ir_mcs_mask_new(lon_c1:xdim_ori,lat_c1:lat_c2);ir_mcs_mask_new(1:lon_c2,lat_c1:lat_c2)];
                ir_nomcs_mask_tmp = [ir_nomcs_mask_new(lon_c1:xdim_ori,lat_c1:lat_c2);ir_nomcs_mask_new(1:lon_c2,lat_c1:lat_c2)];
                pr_tmp = [pr(lon_c1:xdim_ori,lat_c1:lat_c2);pr(1:lon_c2,lat_c1:lat_c2)];
                vv_tmp = [vv_re(lon_c1:xdim_ori,lat_c1:lat_c2);vv_re(1:lon_c2,lat_c1:lat_c2)];
                   
            elseif lat_c-mo>=1 && lat_c+mo<=ydim && lon_c+mo>xdim
                lon1 = lon(lon_c-mo)-0.375;
                lon2 = lon(lon_c+mo-xdim)+0.375;
                lat1 = lat(lat_c-mo)-0.375;
                lat2 = lat(lat_c+mo)+0.375;
                [val,lon_c1]=min(abs(lon_ori-lon1));
                [val,lon_c2]=min(abs(lon_ori-lon2));
                [val,lat_c1]=min(abs(lat_ori-lat1));
                [val,lat_c2]=min(abs(lat_ori-lat2));
                ir_mcs_mask_tmp = [ir_mcs_mask_new(lon_c1:xdim_ori,lat_c1:lat_c2);ir_mcs_mask_new(1:lon_c2,lat_c1:lat_c2)];
                ir_nomcs_mask_tmp = [ir_nomcs_mask_new(lon_c1:xdim_ori,lat_c1:lat_c2);ir_nomcs_mask_new(1:lon_c2,lat_c1:lat_c2)];
                pr_tmp = [pr(lon_c1:xdim_ori,lat_c1:lat_c2);pr(1:lon_c2,lat_c1:lat_c2)];
                vv_tmp = [vv_re(lon_c1:xdim_ori,lat_c1:lat_c2);vv_re(1:lon_c2,lat_c1:lat_c2)];
            else
                lon1 = lon(lon_c-mo)-0.375;
                lon2 = lon(lon_c+mo)+0.375;
                lat1 = lat(lat_c-mo)-0.375;
                lat2 = lat(lat_c+mo)+0.375;
                [val,lon_c1]=min(abs(lon_ori-lon1));
                [val,lon_c2]=min(abs(lon_ori-lon2));
                [val,lat_c1]=min(abs(lat_ori-lat1));
                [val,lat_c2]=min(abs(lat_ori-lat2));
                ir_mcs_mask_tmp = ir_mcs_mask_new(lon_c1:lon_c2,lat_c1:lat_c2);
                ir_nomcs_mask_tmp = ir_nomcs_mask_new(lon_c1:lon_c2,lat_c1:lat_c2);
                pr_tmp = pr(lon_c1:lon_c2,lat_c1:lat_c2);
                vv_tmp = vv_re(lon_c1:lon_c2,lat_c1:lat_c2);
            end

            tmp = vv_tmp(ir_mcs_mask_tmp);
            m_vv_mcs = mean(tmp(:),'omitnan');
            tmp = vv_tmp(ir_nomcs_mask_tmp);
            m_vv_nonmcs = mean(tmp(:),'omitnan');
            mask_pr = pr_tmp>2; mask_dry = pr_tmp<=2;
            tmp = vv_tmp(logical(ir_nomcs_mask_tmp.*mask_pr));
            m_vv_nonmcs_pr2 = mean(tmp(:),'omitnan');
            tmp = vv_tmp(logical(ir_nomcs_mask_tmp.*mask_dry));
            m_vv_nonmcs_dry2 = mean(tmp(:),'omitnan');
            mask_pr = pr_tmp>2; mask_dry = pr_tmp<=2;
            tmp = vv_tmp(logical(ir_mcs_mask_tmp.*mask_pr));
            m_vv_mcs_pr2 = mean(tmp(:),'omitnan');
            tmp = vv_tmp(logical(ir_mcs_mask_tmp.*mask_dry));
            m_vv_mcs_dry2 = mean(tmp(:),'omitnan');
            cell_vv(end+1,:) = {m_vv_mcs,m_vv_nonmcs,m_vv_nonmcs_pr2,m_vv_nonmcs_dry2,m_vv_mcs_pr2,m_vv_mcs_dry2,hr};
        end
    end
    save(['/neelin2020/ACRE/Processed_ACRE_revised/MCS_std_ceres_vv_10x10rc_12hrb_' yyyy mm dd '_new_ave.mat'],'cell_vv');
    clear cell_vv;
end
end
end

