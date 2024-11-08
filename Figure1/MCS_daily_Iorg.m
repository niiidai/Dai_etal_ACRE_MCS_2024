%with zero rain pixels
clear all;
addpath('../Shared');
addpath('../Project4');

xdim=1440; ydim=200; mo = 19;
lon=(0.125:0.25:360-0.125)';
lat=(-24.875:0.25:24.875)';

cj = zeros(1,ydim);
for j = 1:ydim
   rlat=0.017453293*(lat(j));
   cj(j)=sqrt(cos(rlat));
end
cj = repmat(cj,xdim,1);

%%---------------------------------------
for yy = 2001:2017
for mon = 1:12
startdate = datenum(yy,mon,01);
enddate = datenum(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    cell_Iorg = {};
    yyyy = datestr(date,'yyyy');
    mm = datestr(date,'mm');
    dd = datestr(date,'dd');
    fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
     
    load(fn_mcs);
    for hr = 1:2:48
        for j = 20:20:180
            for i = 0:20:1420
		   if j-mo < 1 || j+mo>ydim
                      continue
		   elseif j-mo>=1 && j+mo<=ydim && i-mo<1
		      ir_mcs_mask_tmp = [ir_mcs_mask((xdim+i-mo):xdim,j-mo:j+mo,hr);ir_mcs_mask(1:(i+mo),j-mo:j+mo,hr)];
		   elseif j-mo>=1 && j+mo<=ydim && i+mo>xdim
                      ir_mcs_mask_tmp = [ir_mcs_mask((i-mo):xdim,j-mo:j+mo,hr);ir_mcs_mask(1:(i+mo-xdim),j-mo:j+mo,hr)];
		   else
		      ir_mcs_mask_tmp = squeeze(ir_mcs_mask(i-mo:i+mo,j-mo:j+mo,hr));
		   end
                   CC = bwconncomp(ir_mcs_mask_tmp);
        	   s = regionprops(CC, {'area','centroid'});
                   cents = zeros(numel(s),2);
        	   cents_area = zeros(numel(s),1);
        	   for k = 1:numel(s)
            		cents(k,:) = s(k).Centroid;
            		cents_area(k,:) = s(k).Area;
                   end
        	   if CC.NumObjects <=1
			cell_Iorg(end+1,:) = {NaN,mean(cents_area,'omitnan'),max(cents_area,[],'omitnan'),1,hr};
        	   else
        
        	   %index = cents_area == 1;
        	   %cents(index,:) = [];
        	   sz = size(cents);
          	   dist = zeros(sz(1),1);

        	   for k = 1:sz(1)
            		cents_cp = cents;
            		cents_cp(k,:) = [];

            		distances = sqrt(sum(bsxfun(@minus, cents_cp, cents(k,:)).^2,2));
            		if isempty(distances) 
                	   dist(k) = NaN
            		else
                	   dist(k) = min(distances);
            		end
    
            		if cents(k,1) == j-mo
                	   tmp_point = [j+mo, cents(k,2)];
            		elseif cents(k,1) == j+mo
                	   tmp_point = [j-mo, cents(k,2)];
            		elseif cents(k,2) == i-mo
                	   tmp_point = [cents(k,1), i+mo];
            		elseif cents(k,2) == i+mo
                	   tmp_point = [cents(k,1), i-mo];
            		else 
                	   tmp_point = [];
            		end
    
            		if ~isempty(tmp_point)
                	   distances_2 = sqrt(sum(bsxfun(@minus, cents_cp, tmp_point).^2,2));
                	   dist_2 = min(distances_2);
                	   dist(k) = min(dist(k),dist_2);
            		end
        	   end

        	   NNCDF = cumsum(sort(dist)) ./ sum(sort(dist));
        	   NNCDF_rand = 1-exp((-1).*numel(s)./(mo*2+1)^2.*pi.*sort(dist).*sort(dist));

        	   A = trapz(NNCDF_rand, NNCDF);
		   cell_Iorg(end+1,:) = {A,mean(cents_area,'omitnan'),max(cents_area,[],'omitnan'),CC.NumObjects,hr};
		   end
            end
        end
    end
    save(['/neelin2020/ACRE/Processed/MCS_Iorg_every5_10x10rc_' yyyy mm dd '.mat'],'cell_Iorg');
    clear cell_Iorg;
end
end
end
