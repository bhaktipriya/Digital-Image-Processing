% tone mapping

I=getpfmraw('rosette.pfm');

%linear mapping
r=linear_mapping(I(:,:,1));
g=linear_mapping(I(:,:,2));
b=linear_mapping(I(:,:,3));

imhist(I(:,:,1));

O=zeros(size(I));
O(:,:,1)=r;
O(:,:,2)=g;
O(:,:,3)=b;
b1=O(:,:,1);
figure,imshow((O));