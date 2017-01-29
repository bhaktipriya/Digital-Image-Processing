I = imread('boy_smiling.jpg');
inte = integral_Image(I);
re = reconstruct_Integral(inte);
imshow(uint8(re));  