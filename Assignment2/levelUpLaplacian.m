function [ O ] = levelUpLaplacian( RI, L, sigma )
%upsample Reduced imagee RI
O = upsample(RI);
O = uint8(uint8(O) + L);