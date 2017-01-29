function [ val, out ] = hitandmisstransform( I, a)
% erode I with sel
sel = ones(a,a);
sel_ = strel('arbitrary',sel);
t1=imerode(I, sel_);

% I complement erode with w=w-sel
w = padarray(sel, [3,3]);
w = ~1;
w_ = strel('arbitrary',w);
Icomp = ~ I;
t2=imerode(I,w_);


t3 = t1.*t2;

val =sum(sum(t3));

out = zeros(size(I));
if val > 0
    out = t3;
    %imshow(t3);
end

end

