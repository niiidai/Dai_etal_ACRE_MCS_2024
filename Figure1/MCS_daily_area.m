%with zero rain pixels
clear all;
addpath('../Shared');
addpath('../Project4');

xdim=1440; ydim=200; mo = 19;  %mo = 19 is for 10x10 degree box, mo = 39 for 20x20 degree box, and mo = 59 for 30x30 etc.

lon=(0.125:0.25:360-0.125)';
lat=(-24.875:0.25:24.875)';

%%---------------------------------------
for yy = 2001:2017
for mon = 1:12
startdate = datenum(yy,mon,01);
enddate = datenum(yy,mon,eomday(yy,mon));
for date = startdate:enddate
    cell_area = {};
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
        	   s = regionprops(CC, {'area'});
        	   cents_area = zeros(numel(s),1);
        	   for k = 1:numel(s)
            		cents_area(k,:) = s(k).Area;
                end
	           cell_area(end+1,:) = {mean(cents_area(:),'omitnan'),sum(cents_area(:),'omitnan'),CC.NumObjects,hr};
            end
        end
    end
    save(['/neelin2020/ACRE/Processed/MCS_area_every5_10x10rc_' yyyy mm dd '.mat'],'cell_area');
    clear cell_area;
end
end
end
