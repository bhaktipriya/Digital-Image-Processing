I = imread('face.png');
O = bilateralFilter(I, 15, 20);
figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(uint8(O));
