I=imread('document1.jpg');
I=rgb2gray(I);
I = imadjust(I);
%figure,imshow(I);
ws=75;
nhood=ones(ws);
std=stdfilt(I,nhood);
mean=imfilter(I,fspecial('average',ws),'replicate');
out = zeros(size(I));
a=0.98;
b=0.02;
c=5;
for i = 1:size(I,1)
    for j = 1:size(I,2)
        if(I(i,j)>uint32(a*mean(i,j)+b*std(i,j)-c))
            out(i,j)=1;            
        end
    end
end
out = out;
B = ordfilt2(out,4,ones(2,2));
B=~B;
sel=strel('square',2);
B=imopen(B,sel);
B=imclose(B,sel);
B=~B;
imshow(B);