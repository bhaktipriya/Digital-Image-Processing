function [ O ] = blend( cow, bg, mask, levels, sigma )

mask = uint8(mask);
nmask = uint8(~mask);
cow_lp = laplacianPyramid(cow, levels, sigma);

bg_lp = laplacianPyramid(bg, levels, sigma);

mask_lp = laplacianPyramid(mask, levels, sigma);

L = cow_lp.*uint8(mask_lp) + bg_lp.*uint8(~mask_lp);
    
I = upsample(L) ;


for level = levels-1:-1:1
    cow_lp = laplacianPyramid(cow, level, sigma);

    bg_lp = laplacianPyramid(bg, level, sigma);

    mask_lp = laplacianPyramid(mask, level, sigma);
    nmask_lp = laplacianPyramid(nmask, level, sigma);
    L = cow_lp.*uint8(mask_lp) + bg_lp.*uint8(nmask_lp);
    
    %fprintf('level = %d L %d %d: I %d %d: C %d %d \n', level, size(L,1), size(L, 2), size(I,1), size(I,2), size(cow_lp,1), size(cow_lp,2));
    
    O = L + I;
    
    %I = upsample(O);
    I = imresize(O,2);
    
end

end

