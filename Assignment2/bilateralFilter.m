function [ op ] = bilateralFilter(ip,w,sigma)
%create gaussian
G = fspecial('gaussian', w, 15);
op = ip;
% window size always even
pad=uint32((w/2)-1);
ip = double(ip);
% iterate over every pixel
for i = 1+pad:size(ip,1)-pad
    for j = 1+pad:size(ip,2)-pad
      A = ip(i-pad:i+pad, j-pad:j+pad); 
      dim = size(A);
      if(dim(1) == dim(2) && dim(1) == w)
        mid=uint32(w/2);
        A = double(A);
        % intensity diff
        F = (A - A(mid,mid));
        F = F.^2;
        F = -1*(F/(2*sigma*sigma));
        F = exp(F);
       % disp(F);
        %fprintf('%d %d %d %d\n',size(G,1),size(G,2),size(F,1),size(F,2));
        % Gaussian * filter
        H = G.*F ;
        wp = sum(sum(H));
        % normalize using wp
        H = H/wp;
        %intensity * weight
        K= H.*A;
        %new pixel value
        op(i,j) = sum(sum(K));
      end
     end
end
end

