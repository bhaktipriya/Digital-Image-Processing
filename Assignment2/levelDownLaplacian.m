function [ L R ] = levelDownLaplacian(I, sigma)
            O = [];
            O = imgaussfilt(I,sigma);
            l = uint8((size(O,1))/2)-1;
            b = uint8((size(O,2))/2)-1;
            L = [];
            L = uint8(I - O);
            R = zeros(l,b); 
            for i=1:1:l
                for j=1:1:b
                    R(i,j) = O(2*i,2*j);
                end
            end
            R = uint8(R);
            
end

