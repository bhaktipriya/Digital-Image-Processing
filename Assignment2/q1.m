%apply for separate channels
I = imread('bell.jpg');
G = highboost(I,5,4);
figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(G);
