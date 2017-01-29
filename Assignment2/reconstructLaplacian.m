function [ R ] = reconstructLaplacian(L)
    levels = size(L,2);
    R = cell(1,levels);
    R{levels} = L{levels};
    % l1 l2 l4 l4 l5
    % r1 r2 r3 r4 +l5 
    for level = levels-1:-1:1
        R{level}= L{level} + imresize(R{level+1},size(L{level})); 
    end

end

