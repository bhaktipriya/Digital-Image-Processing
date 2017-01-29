function [ I ] = integral_Image( i )
    I = zeros(size(i));
    for x = 1:size(i,1)
        for y = 1:size(i,2)
                %fprintf('%d %d \n', i,j);
                I (x,y,:) = (i(x,y,:));
                if(x>1)
                    I (x,y,:) = (I (x-1,y,:)+I (x,y,:));
                end;
                if(y>1)
                    I (x,y,:) = (I (x,y-1,:)+I (x,y,:));
                end;
                if(x>1 && y>1)
                    I (x,y,:) = (I (x,y,:)- I (x-1,y-1,:));
                end;
                    
        end
    end


end

