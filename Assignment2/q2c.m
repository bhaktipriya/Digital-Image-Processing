cow = im2double(imread('source.jpg'));
bg = im2double(imread('target.jpg'));
mask = im2double(imread('mask.png'));

merged = bg; 

levels = 4;
R = blendSingleChannel(cow(:,:,1), bg(:,:,1),mask,levels);
G = blendSingleChannel(cow(:,:,2), bg(:,:,2),mask,levels);
B = blendSingleChannel(cow(:,:,3), bg(:,:,3),mask,levels);

merged(:,:,1) = R{1};
merged(:,:,2) = G{1};
merged(:,:,3) = B{1};
imshow(merged);
