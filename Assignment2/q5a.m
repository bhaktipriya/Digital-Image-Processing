x = pi/6;   
T=[cos(x)  -sin(x) 0; sin(x) cos(x) 0; 0 0 1];
%T = [0.5 0; 0 0.5];
I = imread('boy_smiling.jpg');
O = transform(uint8(I), T);
figure;
imshow(uint8(O));