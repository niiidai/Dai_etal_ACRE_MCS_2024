%with zero rain pixels
clear all;
addpath('~/Shared');
addpath('~/Project_ExtremePrecip');
addpath('~/Shared/npy-matlab-master/npy-matlab/');

xdim=360; ydim=50; mo = 4; mo1 = (mo*2+1)*4;
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
mask_w_mcs_02 = zeros(mo1,mo1,27,4);
mask_w_mcs_08 = zeros(mo1,mo1,27,4);
w_spat_mcs_02 = zeros(mo1,mo1,27,4);
w_spat_mcs_08 = zeros(mo1,mo1,27,4);
for mon = 1:12
startdate = datetime(yy,mon,01);
enddate = datetime(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    yyyy = num2str(year(date), '%04d');
    mm = num2str(month(date), '%02d');
    dd = num2str(day(date), '%02d');
    fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
    load(fn_mcs);
    fn_w = ['/neelin2020/ERA-5_uv/omega/era-5_omega_hourly_' yyyy mm dd '.npy'];
    ww = readNPY(fn_w);
    ww(ww>1e+17)= NaN;
    ww = permute(ww,[4 3 2 1]);
   
    for hr = 1:6:48
        % Set MCS with area smaller than 1x1deg (= 16) to zero
        ir_mcs_mask_nosmall = ir_mcs_mask(:,:,hr); 
        CC = bwconncomp(ir_mcs_mask_nosmall);
        numPixels = cellfun(@numel, CC.PixelIdxList);
        mcs_cc_idx = find(numPixels < 16); % Indices of connected components with area<1x1deg
        for mcs_idx = 1:length(mcs_cc_idx)
            ir_mcs_mask_nosmall(CC.PixelIdxList{mcs_cc_idx(mcs_idx)}) = 0;
        end %end-mcs_idx

        w_2 = cat(1,squeeze(ww(end-9:end,:,:,(hr-1)/6+1)),squeeze(ww(:,:,:,(hr-1)/6+1)),squeeze(ww(1:10,:,:,(hr-1)/6+1)));
        lon_w = (-2.5:0.25:362.25)';
        lat_w = (-25.25:0.25:25.25)';
        [X_w,Y_w] = meshgrid(lat_w,lon_w);
        w_re = zeros(xdim_ori,ydim_ori,27);
        for k = 1:27
            w_re(:,:,k) = interp2(X_w,Y_w,double(w_2(:,:,k)),X_ori,Y_ori,'linear');
        end 
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
                w_tmp = cat(1,squeeze(w_re(lon_c1:xdim_ori,lat_c1:lat_c2,:)),squeeze(w_re(1:lon_c2,lat_c1:lat_c2,:)));
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
                w_tmp = cat(1,squeeze(w_re(lon_c1:xdim_ori,lat_c1:lat_c2,:)),squeeze(w_re(1:lon_c2,lat_c1:lat_c2,:)));
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
                w_tmp = w_re(lon_c1:lon_c2,lat_c1:lat_c2,:);
            end

            pr(pr<=0) = NaN;
            m_pr_mcs = mean(pr(CC.PixelIdxList{i}),'omitnan');
            
            tmp = pr_tmp(ir_mcs_mask_tmp);
            tmp(tmp<=0) = NaN;
            f_pr_mcs = sum(tmp(:),'omitnan')/sum(pr_tmp(:),'omitnan');

            
            if f_pr_mcs < 0.5193
                if m_pr_mcs > 0 && m_pr_mcs <=0.475179841279616
                    mask_w_mcs_02(:,:,:,1) = mask_w_mcs_02(:,:,:,1) + ~isnan(w_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    w_spat_mcs_02(:,:,:,1) = w_spat_mcs_02(:,:,:,1) + w_tmp_1;
                elseif m_pr_mcs > 0.475179841279616 && m_pr_mcs <= 1.10487983656506
                    mask_w_mcs_02(:,:,:,2) = mask_w_mcs_02(:,:,:,2) + ~isnan(w_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    w_spat_mcs_02(:,:,:,2) = w_spat_mcs_02(:,:,:,2) + w_tmp_1;
                elseif m_pr_mcs > 1.10487983656506 && m_pr_mcs <= 1.98303422394794
                    mask_w_mcs_02(:,:,:,3) = mask_w_mcs_02(:,:,:,3) + ~isnan(w_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    w_spat_mcs_02(:,:,:,3) = w_spat_mcs_02(:,:,:,3) + w_tmp_1;
                elseif m_pr_mcs > 1.98303422394794
                    mask_w_mcs_02(:,:,:,4) = mask_w_mcs_02(:,:,:,4) + ~isnan(w_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    w_spat_mcs_02(:,:,:,4) = w_spat_mcs_02(:,:,:,4) + w_tmp_1;
                end
            elseif f_pr_mcs > 0.7866
                if m_pr_mcs > 0 && m_pr_mcs <= 0.475179841279616
                    mask_w_mcs_08(:,:,:,1) = mask_w_mcs_08(:,:,:,1) + ~isnan(w_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    w_spat_mcs_08(:,:,:,1) = w_spat_mcs_08(:,:,:,1) + w_tmp_1;
                elseif m_pr_mcs > 0.475179841279616 && m_pr_mcs <= 1.10487983656506
                    mask_w_mcs_08(:,:,:,2) = mask_w_mcs_08(:,:,:,2) + ~isnan(w_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    w_spat_mcs_08(:,:,:,2) = w_spat_mcs_08(:,:,:,2) + w_tmp_1;
                elseif m_pr_mcs > 1.10487983656506 && m_pr_mcs <= 1.98303422394794
                    mask_w_mcs_08(:,:,:,3) = mask_w_mcs_08(:,:,:,3) + ~isnan(w_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    w_spat_mcs_08(:,:,:,3) = w_spat_mcs_08(:,:,:,3) + w_tmp_1;
                elseif m_pr_mcs > 1.98303422394794
                    mask_w_mcs_08(:,:,:,4) = mask_w_mcs_08(:,:,:,4) + ~isnan(w_tmp);
                    w_tmp_1 = w_tmp; w_tmp_1(isnan(w_tmp_1)) = 0;
                    w_spat_mcs_08(:,:,:,4) = w_spat_mcs_08(:,:,:,4) + w_tmp_1;
                end
            end
           
        end
    end
end
end

save(['/neelin2020/ACRE/Processed_ACRE_revised/MCS_PRfracactual_VV_spat_10x10_02_' yyyy '.mat'],'w_spat_mcs_02','mask_w_mcs_02');
save(['/neelin2020/ACRE/Processed_ACRE_revised/MCS_PRfracactual_VV_spat_10x10_08_' yyyy '.mat'],'w_spat_mcs_08','mask_w_mcs_08');
end
