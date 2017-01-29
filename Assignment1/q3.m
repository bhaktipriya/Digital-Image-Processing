rgbImage = imread('car.png');
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);
rows=0;
cols=0;
channels=0;
[rows cols channels] = size(rgbImage);
mask=ones([rows cols 1]);
mask(250:400, :,:) = 0;
figure
imshow(mask)
% builds a Gaussian filter matrix of 7 rows and 7 columns, with standard deviation of 5
filt = fspecial('gaussian', [7, 7], 5)  
resultRedChannel = roifilt2(filt, redChannel,mask);
resultGreenChannel = roifilt2(filt, greenChannel,mask);
resultBlueChannel = roifilt2(filt, blueChannel,mask);
resultRGB = cat(3,resultRedChannel,resultGreenChannel,resultBlueChannel);
figure
imshow(resultRGB);
%imshowpair(rgbImage,resultRGB,'diff');
cx=round(rows/2);
cy=round(cols/2);
radius=250;
[irows icols] = meshgrid(1:rows, 1:cols);
circle=(irows - cx).^2 + (icols - cy).^2 <= radius.^2;
vignette=mat2gray(circle);

for i =1:8
    vignette=imgaussfilt(vignette,20);
end

vignette=imresize(vignette, [rows cols]);
figure
imshow(vignette);
vignette=repmat(vignette,[1 1 3]);
rgb=im2double(resultRGB);
resultRGB=rgb.*vignette;

figure
imshow(resultRGB)