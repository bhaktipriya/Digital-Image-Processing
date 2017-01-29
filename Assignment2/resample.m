function [ intensity ] = resample( I,ix,iy)
% bilinear interpolation


lx = floor(ix);
mx = ceil(ix);
ly = floor(iy);
my = ceil(iy);

%ul--[dx]--|--[1-dx]---ur%
%|         | 
%1-dy      |    
%|         |  
%---------u,v----------%
%
%|         |      
%dy        |
%|         |
%|         |
%ll-------------------lr%

%weights for upper left, upper right, lower left, lower right
dx = (ix-lx);
dy = (iy-ly);
dul=(1-dx)*(1-dy);
dur=dx*(1-dy);
dll=(1-dx)*dy;
dlr=dx*dy;
if(lx>0 && ly>0 && mx>0&& my>0 && lx<=size(I,1) && mx<=size(I,1) && ly<=size(I,2) && my<=size(I,2))
intensity = dul*I(lx,ly,:)+ dur*I(mx,ly,:)+ dll*I(lx,my,:)+dlr*I(mx,my,:);
else
    intensity=0;
end
end
