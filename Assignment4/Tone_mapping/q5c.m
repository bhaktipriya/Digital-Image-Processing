I = getpfmraw('lips.pfm');
r=dodgeandburn(I(:,:,1));
g=dodgeandburn(I(:,:,2));
b=dodgeandburn(I(:,:,3));

O=zeros(size(I));
O(:,:,1)=r;
O(:,:,2)=g;
O(:,:,3)=b;

figure,imshow(tonemap(I));
