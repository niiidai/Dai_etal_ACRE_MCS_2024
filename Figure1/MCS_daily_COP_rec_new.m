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

%%---------------------------------------
for yy = 2001:2019
for mon = 1:12
startdate = datenum(yy,mon,01);
enddate = datenum(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    cell_COP = {};
    yyyy = datestr(date,'yyyy');
    mm = datestr(date,'mm');
    dd = datestr(date,'dd');
    fn_mcs = ['/global/project/projectdirs/m3786/ndai/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
    load(fn_mcs);
    for hr = 1:2:48
        CC = bwconncomp(ir_mcs_mask(:,:,hr));
        s = regionprops(CC, {'area','centroid'});
        cents = zeros(numel(s),2);
	cents_area = zeros(numel(s),1);
        for i = 1:numel(s)
            cents(i,:) = s(i).Centroid;
            cents_area(i,:) = s(i).Area;
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
		ir_mcs_novalue = (~ir_mcs_mask_tmp.*ir_nomcs_mask_tmp)==0;
                CC_domain = bwconncomp(ir_mcs_mask_tmp);
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
                ir_mcs_novalue = (~ir_mcs_mask_tmp.*ir_nomcs_mask_tmp)==0;
                CC_domain = bwconncomp(ir_mcs_mask_tmp);
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
                ir_mcs_novalue = (~ir_mcs_mask_tmp.*ir_nomcs_mask_tmp)==0;
                CC_domain = bwconncomp(ir_mcs_mask_tmp);
            end
            s_domain = regionprops(CC_domain, {'area','centroid'});
            
            if CC_domain.NumObjects <=1
                cell_COP(end+1,:) = {NaN,hr};
            elseif sum(ir_mcs_novalue(:))/mo1/mo1 > 0.01
                cell_COP(end+1,:) = {NaN,hr};
            else
                cents_domain = zeros(numel(s_domain),2);
                cents_domain_area = zeros(numel(s_domain),1);
                for k = 1:numel(s_domain)
                    cents_domain(k,:) = s_domain(k).Centroid;
            	    cents_domain_area(k,:) = s_domain(k).Area;
                end
                
                pair = nchoosek(1:numel(s_domain),2);
        
                A_i = cents_domain_area(pair(:,1));
                A_j = cents_domain_area(pair(:,2));
                dist = sqrt(sum(bsxfun(@minus, cents_domain(pair(:,1),:), cents_domain(pair(:,2),:)).^2,2));
                V = (sqrt(A_i) + sqrt(A_j))./dist./sqrt(pi);
                COP_tmp = mean(V,'omitnan');
                cell_COP(end+1,:) = {COP_tmp,hr};
            end
        end
    end
    save(['/global/project/projectdirs/m3786/ndai/Processed/MCS_COP_10x10rc_' yyyy mm dd '_new_rerun.mat'],'cell_COP');
    clear cell_COP;
end
end
end
