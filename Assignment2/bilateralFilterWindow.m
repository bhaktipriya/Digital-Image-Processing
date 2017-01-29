function [ op ] = bilateralFilterWindow(I)
I= double(I);
w = size(I);
%fprintf('%d %d \n', w(1),w(2));
w=w(1);
mid = uint32(w/2);
G = fspecial('gaussian', w, 1);
F = (I - I(mid,mid));
%disp(I);
F = F.*F;
F = -1*F/255;
F = exp(F);
%disp(size(F));
sf=size(F);
sg=size(G);
fprintf('F%d %d :G %d %d\n', sf(1),sf(2), sg(1),sg(2));
H = G.*F ;
wp = sum(sum(H));
H = H/wp;
K= H.*I;
op = sum(sum(K);
end

