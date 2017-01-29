function [ ii ] = fast_integral_image( I )

% Cumulative sum S
 S = cumsum(I,2);
 
 for i = 1: size(I,1)
     for j = 1:size(I,2)
         ii(i,j) = S(i,j);
                  
         if(i>1)
         ii(i,j) = ii(i,j) + ii(i-1,j); 
         end
         
     end
 end

end

