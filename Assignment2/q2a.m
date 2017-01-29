I = im2double(imread('cameraman.tif'));
sigma = 2;
level = 5;
G = gaussianPyramid(I,level,5,sigma);
L = laplacianPyramid(G,level);

for i = 1:level
    figure
    imshow(G{i});
end

for i = 1:level-1
    figure
    imshow(L{i});
end