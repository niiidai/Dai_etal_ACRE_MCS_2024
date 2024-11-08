%with zero rain pixels
clear all;
addpath('../Shared');
addpath('../Project4');

xdim=1440; ydim=200; mo = 19;
%mo = 19 is for 10x10 degree box, mo = 39 for 20x20 degree box, and mo = 59 for 30x30 etc.
lon=(0.125:0.25:360-0.125);
lat=(-24.875:0.25:24.875);

cj = zeros(1,ydim);
for j = 1:ydim
   rlat=0.017453293*(lat(j));
   cj(j)=sqrt(cos(rlat));
end
cj = repmat(cj,xdim,1);

%%---------------------------------------
for yy = 2001:2017
for mon = 1:12
mean_aos = [];
mean_aos_mcs = [];
mean_aos_nonmcs = [];
startdate = datenum(yy,mon,01);
enddate = datenum(yy,mon,eomday(yy,mon));
  for date = startdate:enddate
    yyyy = datestr(date,'yyyy');
    mm = datestr(date,'mm');
    dd = datestr(date,'dd');
    fn_mcs = ['/neelin2020/MERGED_IR/MCS_MASK/' yyyy '/merg_ir.mcs_mask.' yyyy mm dd '.mat']
    fn_mse = ['/neelin2020/ACRE/ERA5/ERA5_VV500_' yyyy mm dd '.nc_VV500.nc'];
     
    load(fn_mcs);
    mse = ncread(fn_mse,'w'); 
    for hr = 1:2:48
        for j = 21:20:181
            for i = 21:20:1421
                   tmp_mse = mse(i-mo:i+mo-1,j-mo:j+mo-1,(hr+1)/2);
                   aos = numel(find(tmp_mse>0))/numel(tmp_mse);
                   aos_mcs = numel(find(tmp_mse(ir_mcs_mask(i-mo:i+mo-1,j-mo:j+mo-1,hr))>0))/numel(tmp_mse(ir_mcs_mask(i-mo:i+mo-1,j-mo:j+mo-1,hr)));
                   aos_nonmcs = numel(find(tmp_mse(ir_nomcs_mask(i-mo:i+mo-1,j-mo:j+mo-1,hr))>0))/numel(tmp_mse(ir_nomcs_mask(i-mo:i+mo-1,j-mo:j+mo-1,hr)));
                   mean_aos = [mean_aos aos];
                   mean_aos_mcs = [mean_aos_mcs aos_mcs];
                   mean_aos_nonmcs = [mean_aos_nonmcs aos_nonmcs];
            end
        end
    end
  end 
save(['/neelin2020/ACRE/Processed/MCS_mean_aos_' yyyy mm '.mat'],'mean_aos','mean_aos_mcs','mean_aos_nonmcs');
clear mean_aos;
clear mean_aos_mcs;
clear mean_aos_nonmcs;
end
end
