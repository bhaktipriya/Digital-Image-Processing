function [ op ] = smoothening( ip, w )
H = fspecial('gaussian',[w w], 5);
op = imfilter(ip, H);
end

