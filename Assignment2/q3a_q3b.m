I = imread('boy_smiling.jpg');
inte = integral_Image(I);
re = reconstruct_Integral(inte);
%'Reconstructed double'
imshow(uint8(re));

inte = integral_Image_uint8(I);
%'Reconstructed integral image
figure;
imshow(uint8(inte));

re = reconstruct_Integral(uint8(inte));
%'Reconstructed uint8'
figure;
imshow(uint8(re));

