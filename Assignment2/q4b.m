I = imread('boy_smiling.jpg');
rChannel = I(:,:,1);
gChannel = I(:,:,2);
bChannel = I(:,:,3);
w = 15;
sigma =20;
rChannel = bilateralFilter(rChannel, w, sigma);
gChannel = bilateralFilter(gChannel, w, sigma);
bChannel = bilateralFilter(bChannel, w, sigma);

O = I;
O(:,:,1) = uint8(rChannel);
O(:,:,2) = uint8(gChannel);
O(:,:,3) = uint8(bChannel);

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(O);