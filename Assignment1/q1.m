rgbImage=imread('lena1.jpg');
rgbImage1=imread('lena2.jpg');
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);
redChannel1= rgbImage1(:, :, 1);
greenChannel1 = rgbImage1(:, :, 2);
blueChannel1= rgbImage1(:, :, 3);
blueChanneldiff=blueChannel1-blueChannel;
blueChanneldiff=histeq(blueChanneldiff);
filteredImage=medfilt2(blueChanneldiff,[13,13]);
filteredImage=im2bw(filteredImage,0.5);
filteredImage=imresize(filteredImage,[100,100]);
imshow(filteredImage);


