I2 = im2double(imread('bell.jpg'));
O=I2;
% red channel
RI=I2(:,:,1);
O(:,:,1)=q2bsingleChannel(RI);
% green channel
GI=I2(:,:,2);
O(:,:,2)=q2bsingleChannel(GI);
% blue channel
BI=I2(:,:,3);
O(:,:,3)=q2bsingleChannel(BI);

imshow(O);