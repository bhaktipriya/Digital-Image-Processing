I=imread('document1.jpg');
I=rgb2gray(I);
tr=otsu(I);
O=im2bw(I,tr);
figure,imshow(O)
