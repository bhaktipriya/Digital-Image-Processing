function [ i ] = reconstruct_Integral( I )
i = zeros(size(I));
I_X_Y = padarray(I, [1,1]);
I_X_Y = I_X_Y(2:end,2:end,:);
     %1     2     3     0
     %4     5     6     0
     %7     8     9     0
     %0     0     0     0
        
I_X1_Y1 = padarray(I, [1,1]);
I_X1_Y1 = I_X1_Y1(1:end-1,1:end-1,:);

     %0     0     0     0
     %0     1     2     3
     %0     4     5     6
     %0     7     8     9
    
I_X1_Y = padarray(I, [1,1]);
I_X1_Y = I_X1_Y (1:end-1, 2:end,:);
     %0     0     0     0
     %1     2     3     0
     %4     5     6     0
     %7     8     9     0
    
    
I_X_Y1 = padarray(I, [1,1]);
I_X_Y1 = I_X_Y1 (2:end, 1:end-1,:);
     %0     1     2     3     
     %0     4     5     6     
     %0     7     8     9     
     %0     0     0     0
         
i = I_X_Y + I_X1_Y1 - I_X1_Y - I_X_Y1;     
    
i = i(1:end-1,1:end-1,:);   


end

