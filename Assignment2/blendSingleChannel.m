function [ B ] = blendSingleChannel( cow, bg, mask, levels)

B = cell(1,levels);


cow_g = gaussianPyramid(cow, levels, 5, 3);
bg_g = gaussianPyramid(bg, levels, 5, 3);

cow_lp = laplacianPyramid(cow_g, levels);
bg_lp = laplacianPyramid(bg_g, levels);

mask_g = gaussianPyramid(mask, levels, 5, 3);

B{levels} = cow_lp{levels}.*mask_g{levels} + bg_lp{levels}.*((1-mask_g{levels}));
for level = levels-1:-1:1
    E = [];
    E = cow_lp{level}.*mask_g{level} + bg_lp{level}.*((1-mask_g{level}));
    B{level} = imresize(B{level+1},size(E)) + E; 
end

end

