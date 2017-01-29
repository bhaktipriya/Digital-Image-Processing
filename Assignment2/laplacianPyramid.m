function [ L ] = laplacianPyramid(G, levels)
    L = cell(1,levels);
    L{levels}=G{levels};
    % G1   g2    g3   g4
    %   l1    l2    l3   g4
    for level = 2:1:levels
            %fprintf('%d %d %d %d\n',size(G{level-1},1),size(G{level-1},2),size(G{level},1),size(G{level},2));
            L{level-1} = G{level-1} - imresize(G{level},size(G{level-1}));
    end
end



