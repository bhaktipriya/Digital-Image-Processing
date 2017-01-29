I=imread('soccer_1.png');
%hsv
hsv=rgb2hsv(I);
h=hsv(:, :, 1);
h=uint8(h*255);
s=hsv(:, :, 2); 
v=hsv(:, :, 3);

%segmentation conn comp
%seed assumed to be at the bottom left always
mask=false(size(h));
mask(700,70)=true;
%cutoff +-15 range all cons to be same hue 
h=graydiffweight(h, mask, 'GrayDifferenceCutoff', 15);
thresh=0.01;
[BW, D]=imsegfmm(h, mask, thresh);
%remove ground
BW=~BW;
%image= aud+players
final=BW;

%looks good. will look better without lines :)
E=edge(BW,'sobel');
[H,T,R]=hough(E);
P=houghpeaks(H,2,'threshold',ceil(0.499*max(H(:))));
lines=houghlines(BW,T,R,P,'FillGap',50,'MinLength',10);
% figure, imshow(E), hold on
max_len = 0;
a=[];
b=[];
c=[];

for k=1:length(lines)
   xy=[lines(k).point1; lines(k).point2];
   p1=lines(k).point1;
   p2=lines(k).point2;
   a=[a;(p2(2)-p1(2))];
   b=[b;(p2(1)-p1(1))];
   c=[c;(p1(2)*p2(1)-p2(2)*p1(1))];
   %fprintf('%d %d , %d %d\n', p1(1), p1(2), p2(1), p2(2));
   %plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end

%figure, imshow(BW);
% remove straight edge lines from the image
for k=1:length(lines)
     for i=1:size(BW,1)
         for j=1:size(BW,2)
             
             if(abs((a(k)*(j)+b(k)*(-i)+c(k)))==0)
                  E(i,j)=0;
              end
         end
     end
end

%figure, imshow(E);
% close the image, dil + erosion
se=strel('square', 9);
BW=imdilate(E,se);
BW=imfill(BW,'holes');
se=strel('square', 9);
BW=imerode(BW,se);
   
% remove thick stadium lines
E=edge(BW,'sobel');
[H,T,R]=hough(E);
P=houghpeaks(H,7,'threshold',ceil(0.49*max(H(:))));
lines=houghlines(BW,T,R,P,'FillGap',50,'MinLength',10);
max_len=0;
% figure,imshow(BW),hold on
a=[];
b=[];
c=[];


for k=1:length(lines)
xy=[lines(k).point1; lines(k).point2];
   
    p1=[lines(k).point1(2);lines(k).point1(1)];
    p2=[lines(k).point2(2);lines(k).point2(1)];
    
    
    p1=lines(k).point1;
    p2=lines(k).point2;
    
    a=(p1(2)-p2(2));
    b=(p2(1)-p1(1));
    c=(p2(2)*p1(1)-p1(2)*p2(1));
    for i=1:size(BW,1)
        for j=1:size(BW,2)
            % anything above hough lines will be blackened
            if((a*j+b*i+c)<=20 && abs(a/b)<=0.5)
                BW(i,j)=0;
            end
        end
    end
        
%     plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
%     plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%     plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
%   
end



figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(BW);
