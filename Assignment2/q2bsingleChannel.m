function [ O ] = q2bsingleChannel( I )
level=5;
sigma=5;
G = gaussianPyramid(I,level,5,sigma);
L = laplacianPyramid(G,level);
R = reconstructLaplacian(L);

for i = 1:level-1
%    figure
%    imshow(R{i});
end
O = R{1};
end

