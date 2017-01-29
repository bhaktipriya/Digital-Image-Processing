function [ out ] = linear_mapping(I)
mini=min(min(I));
maxi=max(max(I));

out = zeros(size(I));
for i = 1:size(I,1)
    for j = 1:size(I,2)
        out(i,j) = (((I(i,j))-mini)/(maxi-mini))*255;
    end
end

% out = uint8(out);
end

