I=imread('building_2.jpg');
hsv=rgb2hsv(I);
h=hsv(:, :, 1);
h=uint8(h*255);
s=hsv(:, :, 2); 
s=uint8(s*255);
v=hsv(:, :, 3);
v=uint8(v*255);
% RGB to gray
%I=imgaussfilt(I,2);
I=rgb2gray(I);

%Contrast stretching
C=imadjust(I,stretchlim(I),[]);

%Unsharp masking
S=imsharpen(C);

%local adaptive filtering Otsu method
A=adapthisteq(I,'clipLimit',0.03,'Distribution','rayleigh');
level=graythresh(A);
BW=~im2bw(A,level);

%erode
se=strel('square',5);
BW=imerode(BW,se);
[rows cols]=size(BW);

%remove domes
E=edge(BW,'sobel');
[H,T,R]=hough(E);
P=houghpeaks(H,20,'threshold',ceil(0.49*max(H(:))));
lines=houghlines(BW,T,R,P,'FillGap',5,'MinLength',10);
max_len=0;
%figure,imshow(E),hold on
a=[];
b=[];
c=[];

miny=50000;%min y
minx=50000;%min x

for k=1:length(lines)
   xy=[lines(k).point1; lines(k).point2];
    p1=lines(k).point1;
    p2=lines(k).point2;
    
    a=(p2(2)-p1(2));
    b=(p2(1)-p1(1));
    c=(p1(2)*p2(1)-p2(2)*p1(1));
%    %fprintf('%d %d , %d %d\n', p1(1), p1(2), p2(1), p2(2));
   
   if( abs(a/b)<=0.5)
%        plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
%        plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%        plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
       if((p1(2)<miny))
            miny=p1(2);
       end
   
       if((p2(2)<miny))
           miny=p2(2);
       end
       
       if((p1(1)<minx))
            minx=p1(1);
       end
   
       if((p2(1)<minx))
           minx=p2(1);
       end
   end
end

if(miny==5000)
    miny=0;
end
for i=1:rows
    for j=1:cols
        if(i<=miny)
            BW(i,j)=0;
        end
    end
end

        

figure, imshow(BW);
