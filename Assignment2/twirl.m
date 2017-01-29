function [ N ] = twirl( I,rmax,alpha )
N = I;
l = size(N,1);
b = size(N,2);
xc = l/2;
yc = b/2;

%maxradius = min([xc yc]);
%if(rmax>maxradius)
%    rmax=maxradius;

% looping thru new img
for x = 1:size(N,1)
        for y = 1:size(N,2)
                dx = x -xc;
                dy = y - yc;
                r = pdist([x y; xc yc], 'euclidean');
                beta = atan2(dy,dx) + alpha *((rmax -r)/rmax);
                if(r<=rmax)
                %x in orig image
                xo = xc + r*cos(beta);
                yo = yc + r*sin(beta);
                else
                xo=x;
                yo=y;
                end                
                N(x,y,:) = resample(I,xo,yo);
        end
 end
        
end