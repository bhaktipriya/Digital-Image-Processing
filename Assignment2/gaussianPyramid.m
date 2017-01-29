function [ G ] = gaussianPyramid( I, levels, w, sigma )
        
        G = cell(1,levels);
        F = fspecial('gaussian', w, sigma);
        
        for level = 1:levels
            G{level} = I;
            I = imfilter(I, F);
            RI = imresize(I, 0.5);
            I=[];
            I = RI;
        end
            
end

