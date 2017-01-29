function [ Ld ] = dodgeandburn(A)
alpha1=0.35;
alpha2=1.6*0.35;
eta = 0.05;
a= 0.18;
s =1; 
phi =1;
V1 = zeros([size(A),8]);
V2 = zeros([size(A),8]);
count=1;
while(s<43)
    %change sigmas to get different scales
    sigma1=alpha1*s;
    sigma2=alpha2*s;
    w=ceil(s)+1;
    h1=fspecial('gaussian',w,sigma1);
    h2=fspecial('gaussian',w,sigma2);
    h1=2*h1.*h1;
    h2=2*h2.*h2;
    %response at 2 different scales
    V1(:,:,count) = imfilter(A,h1);
    V2 = imfilter(A,h2);
    %center surround function
    V2(:,:,count)=(V1(:,:,count)-V2)./(((2^phi)*a)/(s^2)+V1(:,:,count));
    threshold = abs(V2)<eta;
    %local avg
     A = A./(1+V1(:,:,count));
    s=s*1.6;
    count=count +1;
end

scale =zeros(size(A,1),size(A,2));
% The values of V1 and V2
% are expected to be very similar in areas of small
% luminance  gradients,  but  will  differ  in  high  contrast  regions.   To
% choose the largest neighborhood around a pixel with fairly even 
% luminances,  we  threshold V
% to  select  the  corresponding  scale s
% 
% Starting at the lowest scale, we seek the first scale
% s where:
% v2>eta
for i=1:size(A,1)
    for j=1:size(A,2)
        for s=1:8
            if V2(i,j,s) > eta
                if(s==1)
                    scale(i,j)=1;
                end
                if(s>1)
                    scale(i,j)=s-1;
                end
                break;
            end
        end
    end
end
for i=1:size(scale,1)
    for j=1:size(scale,2)
        if (scale(i,j)==0)
            scale(i,j)=8;
        end
    end
end

%scale the image to produce dodged and burned img
for i=1:size(A,1)
    for j=1:size(A,2)
        A(i,j)=A(i,j)/(1+V1(i,j,scale(i,j)));
    end
end
Ld=A;