function [ out ] = scaleL( L, lw, a )
out=L;
disp('size is');
disp(size(L));
for i = 1:size(L,1)
    for j = 1:size(L,2)
        out(i,j)=(a*L(i,j))/lw;
    
    end
end

end

