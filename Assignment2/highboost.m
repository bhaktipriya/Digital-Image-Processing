function [ G ] = highboost(I,w,k)
% I image
%window w
%weight k
Iblur = smoothening(I, w);
Gmask = I - Iblur;
G = I + k*Gmask;
end

